import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:test_project/2nd_proj/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeClass(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // full screen width
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color.fromARGB(255, 43, 190, 87),
              Color.fromARGB(255, 187, 221, 38),
              Color.fromARGB(255, 187, 221, 38),
              Color.fromARGB(255, 43, 190, 87),
              Color.fromARGB(255, 43, 190, 87),
            ],
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.yard,
              color: Color.fromARGB(255, 141, 11, 173),
              size: 50,
            ),
            Text(
              'CIP STUDIOZ',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 141, 11, 173),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
