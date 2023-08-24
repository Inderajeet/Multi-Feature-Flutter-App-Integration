import 'package:flutter/material.dart';
import 'package:test_project/1st_proj/add_task.dart';
import 'gallery_screen.dart';
import 'calculator.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Full Project',
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 3;
  final List<Widget> navScreens = [
    HomeScreen(),
    AddTaskScreen(),
    GalleryScreen(),
    CalcScreen(),
  ];

  AppBar appBar() {
    switch (selectedIndex) {
      case 0:
        return AppBar(
          title: Text('Home'),
          backgroundColor: Color.fromARGB(255, 173, 56, 85),
        );
      case 1:
        return AppBar(
          title: Text('Add Task'),
          backgroundColor: const Color.fromARGB(255, 218, 179, 63),
        );
      case 2:
        return AppBar(
          title: Text('Gallery'),
          backgroundColor: Color.fromARGB(255, 47, 206, 131),
        );
      case 3:
        return AppBar(
          title: Text('Calculator'),
          backgroundColor: const Color.fromARGB(255, 165, 132, 32),
        );
      default:
        return AppBar(
          title: Text('App'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: navScreens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow[700],
        clipBehavior: Clip.antiAlias,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 5.0,
        // color: Colors.yellow[700],
        shadowColor: Colors.grey[400],
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 211, 40, 83),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Task Lists',
              backgroundColor: const Color.fromARGB(255, 218, 179, 63),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Gallery',
              backgroundColor: Color.fromARGB(255, 47, 206, 131),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: 'Calculator',
              backgroundColor: const Color.fromARGB(255, 165, 132, 32),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home screen'),
    );
  }
}
