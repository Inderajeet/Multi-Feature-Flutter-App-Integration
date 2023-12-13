import 'package:flutter/material.dart';
import 'package:test_project/SplashscreenAnimation.dart';
import 'package:test_project/Features/Gallery_Page.dart';
import 'package:test_project/Features/Calculator.dart';
import 'package:test_project/Features/Todo.dart';

void main() {
  runApp(SplashScreenCopy());
  // runApp(HomeClass());
  // runApp(SplashScreen());
}

class HomeClass extends StatelessWidget {
  const HomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Practice App',
      home: BottomBarHome(),
    );
  }
}

class BottomBarHome extends StatefulWidget {
  const BottomBarHome({super.key});

  @override
  State<BottomBarHome> createState() => _BottomBarHomeState();
}

class _BottomBarHomeState extends State<BottomBarHome> {
  int selectedIndex = 0;

  List<Widget> navScreen = [
    const Calculator(),
    ImageGridScreen(),
    const Todo(),
  ];

  AppBar appBar() {
    switch (selectedIndex) {
      case 0:
        return AppBar(
          title: const Text('Calculator'),
          backgroundColor: const Color.fromARGB(255, 241, 186, 3),
        );
      case 1:
        return AppBar(
          title: const Text('Gallery'),
          backgroundColor: const Color.fromARGB(255, 173, 42, 199),
        );
      case 2:
        return AppBar(
          title: const Text('To-do'),
          backgroundColor: const Color.fromARGB(255, 197, 31, 87),
        );
      default:
        return AppBar(
          title: const Text('Home'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: navScreen[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        // for floating action btn
        clipBehavior: Clip.antiAlias,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 3.0,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: 'Calculator',
              backgroundColor: Color.fromARGB(255, 241, 186, 3),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Gallery',
              backgroundColor: Color.fromARGB(255, 173, 42, 199),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined),
              label: 'Todo',
              backgroundColor: Color.fromARGB(255, 197, 31, 87),
            ),
          ],
        ),
      ),
    );
  }
}
