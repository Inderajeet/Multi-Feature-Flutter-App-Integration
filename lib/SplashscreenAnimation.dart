import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:test_project/SplashScreen.dart';

class SplashScreenCopy extends StatelessWidget {
  const SplashScreenCopy({super.key});

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
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SplashScreen(),
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
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );
    return Container(
      width: MediaQuery.of(context).size.width, // full screen width
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(width: 20.0, height: 100.0),
          // const Text(
          //   'Be',
          //   style: TextStyle(fontSize: 43.0),
          // ),
          const SizedBox(width: 20.0, height: 100.0),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: screenWidth * 0.105,
              fontFamily: 'Horizon',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                // RotateAnimatedText('Turning'),
                // RotateAnimatedText('Ideas'),
                // RotateAnimatedText('Into'),
                // RotateAnimatedText('DIGITAL MARVELS'),
                TypewriterAnimatedText(
                  'Turning Ideas Into',
                  speed: Duration(milliseconds: 150),
                ),
                FadeAnimatedText(
                  'DIGITAL MARVELS',
                  // speed: Duration(
                  //   milliseconds: 150,
                  // ),
                ),
                // ScaleAnimatedText('CIP STUDIOZ'),
                // TyperAnimatedText(
                //   'CIP STUDIOZ',
                //   speed: Duration(milliseconds: 50),
                //   textStyle: TextStyle(
                //     color: Color.fromARGB(255, 141, 11, 173),
                //   ),
                // ),

                // TypewriterAnimatedText('Turning Ideas Into DIGITAL MARVELS')
              ],
              totalRepeatCount: 1,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
  }
}
