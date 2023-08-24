import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                input,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Divider(
            height: 8.0,
          ),
          buildbuttonRow(['9', '8', '7', '/']),
          buildbuttonRow(['6', '5', '4', '*']),
          buildbuttonRow(['3', '2', '1', '+']),
          buildbuttonRow(['0', 'C', '-', '=']),
        ],
      ),
    );
  }
}

Widget buildbuttonRow(List<String> buttons) {
  return Expanded(
    child: Row(
      children: buttons
          .map(
            (btn) => Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(btn),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
