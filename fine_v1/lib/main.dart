import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hintColor: Colors.amber,
        primaryColor: Colors.amber,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          hintStyle: TextStyle(color: Colors.amber),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(title: 'Fine'),
    );
  }
}
