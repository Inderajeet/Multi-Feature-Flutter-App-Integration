import 'package:flutter/material.dart';
import 'package:test_project/2nd_proj/Calculator.dart';
import 'package:test_project/2nd_proj/Gallery.dart';
import 'package:test_project/2nd_proj/Todo.dart';

class HomeClass extends StatelessWidget {
  const HomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int selectedIndex = 1;
  final List<Widget> navScreen = [Todo(), Calculator(), Gallery(), Todo()];

  AppBar appBar() {
    switch (selectedIndex) {
      case 0:
        return AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blueAccent,
        );
      case 1:
        return AppBar(
          title: Text('Calculator'),
          backgroundColor: Color.fromARGB(255, 211, 186, 46),
        );
      case 2:
        return AppBar(
          title: Text('Gallery'),
          backgroundColor: Color.fromARGB(255, 173, 42, 199),
        );
      case 3:
        return AppBar(
          title: Text('To-do'),
          backgroundColor: Color.fromARGB(255, 197, 31, 87),
        );
      default:
        return AppBar(
          title: Text('Home'),
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: 'Calculator',
              backgroundColor: Color.fromARGB(255, 211, 186, 46),
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
