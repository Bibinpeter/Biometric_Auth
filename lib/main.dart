import 'package:biometric_auth/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _TiltDemoState();
}

class _TiltDemoState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Center(child: Text("Flutter Biometric_Auth Demo")),
        ),
        body: Center(
          child: Tilt(
            borderRadius: BorderRadius.circular(24),
            tiltConfig: const TiltConfig(angle: 15),
            lightConfig: const LightConfig(
              minIntensity: 0.1,
            ),
            shadowConfig: const ShadowConfig(
              minIntensity: 0.05,
              maxIntensity: 0.4,
              offsetFactor: 0.08,
              minBlurRadius: 10,
              maxBlurRadius: 15,
            ),
            childLayout: ChildLayout(
              outer: [
                Positioned(
                  top: 200,
                  child: TiltParallax(
                    size: const Offset(-20, -20),
                    child: Container()
                  ),
                ),
              
              ],
            ),
            child: const MyHomePage(
              title: 'Flutter Bio_Auth ',
            ),
          ),
        ),
      ),
    );
  }
}
