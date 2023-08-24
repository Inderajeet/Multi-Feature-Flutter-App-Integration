import 'package:flutter/material.dart';


class Stackexample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Example'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Text('Bottom Widget'),
                ),
              ),
              Positioned(
                top: 100,
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text('Top Left Widget'),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 80,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Text('Bottom Right Widget'),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Centered Widget',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
