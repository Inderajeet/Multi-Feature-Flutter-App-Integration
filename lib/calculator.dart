import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Add this import for math_expressions


void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  double _result = 0.0;

  void _onNumberButtonPressed(String num) {
    setState(() {
      _input += num;
    });
  }

  void _onOperationButtonPressed(String op) {
    if (_input.isNotEmpty) {
      setState(() {
        _input += ' $op ';
      });
    }
  }

  void _onClearButtonPressed() {
    setState(() {
      _input = '';
      _result = 0.0;
    });
  }

  void _onCalculateButtonPressed() {
    if (_input.isNotEmpty) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_input);
        ContextModel cm = ContextModel();
        _result = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          _input = _result.toString();
        });
      } catch (e) {
        setState(() {
          _input = 'Error';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Text(
                _input,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1),
          buildButtonRow(['7', '8', '9', '+']),
          buildButtonRow(['4', '5', '6', '*']),
          buildButtonRow(['1', '2', '3']),
          buildButtonRow(['0', 'C', '=']),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map(
              (btn) => Expanded(
                child: InkWell(
                  onTap: () {
                    if (btn == 'C') {
                      _onClearButtonPressed();
                    } else if (btn == '=') {
                      _onCalculateButtonPressed();
                    } else if (btn == '+' || btn == '*') {
                      _onOperationButtonPressed(btn);
                    } else {
                      _onNumberButtonPressed(btn);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      btn,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

