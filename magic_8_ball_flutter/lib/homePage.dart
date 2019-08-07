import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ball = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: _setBall,
          child: Image.asset('images/ball$ball.png'),
        ),
      ),
    );
  }

  void _setBall() {
    setState(() {
      ball = Random().nextInt(5) + 1;
    });
  }
}
