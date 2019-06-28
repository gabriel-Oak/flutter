import 'package:flutter/material.dart';
import 'package:marketlist/pages/home.dart';

void main() => runApp(MarketList());

class MarketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketList',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.grey,
        textTheme:  TextTheme(
          headline: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,  
          ),
          title: TextStyle(
            fontSize: 36,
            fontStyle: FontStyle.italic,
            color: Colors.blueGrey
          ),
          body1: TextStyle(fontSize: 14)
        )
      ),
      home: HomePage(),
    );
  }
}