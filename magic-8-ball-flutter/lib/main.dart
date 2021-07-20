import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          title: Text('Ask Me Anything'),
          centerTitle: true,
        ),
        body: EightBall(),
      ),
    ),
  );
}

class EightBall extends StatefulWidget {
  @override
  _EightBallState createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  int answerNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            answerNumber = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$answerNumber.png'),
      ),
    );
  }
}
