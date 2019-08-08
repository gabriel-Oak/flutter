import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final primaryColor = Colors.blue[900];
final accentColor = Colors.blue[400];

final mainTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  scaffoldBackgroundColor: accentColor,
  backgroundColor: accentColor,
  appBarTheme: AppBarTheme(color: primaryColor),
);
