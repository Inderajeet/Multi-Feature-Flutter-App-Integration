import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ToDoDynamic(),
    );
  }
}

class ToDoDynamic extends StatefulWidget {
  const ToDoDynamic({super.key});

  @override
  State<ToDoDynamic> createState() => _ToDoDynamicState();
}

class _ToDoDynamicState extends State<ToDoDynamic> {
  var counter = 0;
  @override
  void _addCounter() {
    setState(() {
      counter++;
    });
  }

  void counterReset() {
    setState(() {
      counter = 0;
    });
  }

  void subCounter() {
    setState(() {
      counter--;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pressed the button this many times'),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 10),
              child: Text('${counter}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      counterReset();
                    },
                    child: Text('Reset'),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    subCounter();
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 199, 43, 199),
        onPressed: () {
          _addCounter();
        },
      ),
    );
  }
}

// Container - child
// Row - children - static not scrollable
// Column - children - static
// Center - child 
// Text - string
// ListView - children - dynamic scrollable
//  buttons

