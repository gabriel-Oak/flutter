import 'package:flutter/material.dart';
import 'package:hello_jamal/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jamal\'s Login',
      theme: ThemeData(        
        primarySwatch: Colors.cyan,
      ),
      home: LoginPage(),
    );
  }
}
