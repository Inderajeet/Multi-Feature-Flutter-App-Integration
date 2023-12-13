import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  double result = 0.0;
  int count = 0;
  int opCount = 0;
  TextEditingController textEditingController = TextEditingController();

  // clear btn
  void allClearBtnPressed() {
    setState(() {
      input = '';
    });
  }

  void clearBtnPressed() {
    setState(() {
      input = input.substring(0, input.length - 1);
    });
  }

  // operators
  void opBtnPressed(op) {
    setState(() {
      if (input.isNotEmpty) {
        input += '${op}';
        opCount += 1;
      }
    });
  }

  // calcuation
  void calculations(calc) {
    if (input.isNotEmpty) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(input);
        ContextModel cm = ContextModel();
        result = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          input = result.toString();
          count += 1;
          // input = '';
        });
      } catch (e) {
        print(e);
        setState(() {
          input = 'Error';
        });
      }
    }
  }

  // numbers
  void btnPressed(numbers) {
    if (count > 1 || input == "Error") {
      setState(() {
        input = '';
        count = 0;
        input += numbers;
      });
    } else if (opCount > 1) {
      setState(() {
        input += numbers;
        opCount = 0;
      });
    }
    // else if (count < 0) {
    //   setState(() {
    //     input += numbers;
    //   });
    // }
    else {
      setState(() {
        input += numbers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                input,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const Divider(
            height: 5,
            color: Color.fromARGB(255, 145, 139, 139),
          ),
          // calcRow(['0', 'sin', 'cos', 'tan']),
          calcRow(['AC', '←', '+/-', '/']),
          calcRow(['7', '8', '9', '*']),
          calcRow(['4', '5', '6', '-']),
          calcRow(['1', '2', '3', '+']),
          calcRow(['%', '0', '.', '=']),
        ],
      ),
    );
  }

  Widget calcRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map(
              (btn) => Expanded(
                child: InkWell(
                  onTap: () {
                    color:
                    Colors.red;
                    if (btn == "AC") {
                      allClearBtnPressed();
                    } else if (btn == "←") {
                      clearBtnPressed();
                    } else if (btn == '-' ||
                        btn == '+' ||
                        btn == '/' ||
                        btn == '*') {
                      opBtnPressed(btn);
                    } else if (btn == '=') {
                      calculations(btn);
                    } else {
                      btnPressed(btn);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 175, 182, 76),
                    ),
                    margin: EdgeInsets.all(4),
                    child: Text(
                      btn,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
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
