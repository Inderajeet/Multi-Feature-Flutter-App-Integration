import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageControl extends StatelessWidget {
  const PageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Page Controller Demo",
      home: Nav_Page(),
    );
  }
}

class Nav_Page extends StatefulWidget {
  const Nav_Page({super.key});

  @override
  State<Nav_Page> createState() => _Nav_PageState();
}

class _Nav_PageState extends State<Nav_Page> {
  final PageController page_controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Control Demo'),
      ),
      body: PageView(
        controller: page_controller,
        // scrollDirection: Axis.vertical,
        children: [
          Home(),
          List(),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
    child:   Text('HOme Page')
    );
  }
}

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('List'),
    );
  }
}
