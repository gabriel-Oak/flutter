import 'package:flutter/material.dart';
import 'theme.dart';
import 'homePage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Magic 8 Ball',
      home: HomePage(),
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
