import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test_project/main.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity, // full screen width
        height: double.infinity,
        decoration: const BoxDecoration(
          // gradient: SweepGradient(
          //   colors: [
          //     Color.fromARGB(255, 43, 190, 87),
          //     Color.fromARGB(255, 187, 221, 38),
          //     Color.fromARGB(255, 187, 221, 38),
          //     Color.fromARGB(255, 43, 190, 87),
          //     Color.fromARGB(255, 43, 190, 87),
          //   ],
          //   // begin: Alignment.topLeft,
          //   // end: Alignment.bottomRight,
          // ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF387F84),
              Color(0xFF367031),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.yard,
            //   color: Color.fromARGB(255, 141, 11, 173),
            //   size: 50,
            // ).animate().fade(duration: 500.milliseconds).scaleY(
            //       begin: 0,
            //       end: 1,
            //       duration: Duration(milliseconds: 500),
            //     ),
            Text(
              'CIP STUDIOZ',
              style: TextStyle(
                fontFamily: 'Chewy',
                fontSize: (screenHeight + screenWidth) * 0.055,
                color: Color.fromARGB(255, 226, 211, 71),
              ),
            ).animate().fade(duration: 500.milliseconds).scaleY(
                  begin: 0,
                  end: 1,
                  duration: Duration(milliseconds: 500),
                ),
          ],
        ),
      ),
    );
  }
}
