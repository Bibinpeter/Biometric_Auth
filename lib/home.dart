import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
   
class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      if (canAuthenticateWithBiometrics) {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: "Hey flutter user please  authenticate to show balance",
          options: const AuthenticationOptions(
            biometricOnly: true,
          ),
        );
        if (didAuthenticate) {
          setState(() {
            _isAuthenticated = true;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _toggleAuthentication() {
    if (_isAuthenticated) {
      setState(() {
        _isAuthenticated = false;
      });
    } else {
      _authenticate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 450,
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          primary: false,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildUI(),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: _toggleAuthentication,
                    child: Icon(
                      _isAuthenticated ? Icons.lock : Icons.lock_open,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Account Balance",
            style: TextStyle(fontSize: 25),
          ),
          if (_isAuthenticated)
            const Text(
              "₹ 24,600",
              style: TextStyle(fontSize: 25),
            )
          else
            const Text(
              "* * * * *",
              style: TextStyle(fontSize: 25),
            )
        ],
      ),
    );
  }
}
