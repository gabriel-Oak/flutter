import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'layout.dart';

void main() => runApp(MarketList());

class MarketList extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketList',
      theme: ThemeData(
        primaryColor: Layout.primary(),
        accentColor: Layout.secondary(),
        brightness: Brightness.light,
        textTheme:  TextTheme(
          headline: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,  
          ),
          title: TextStyle(
            fontSize: 36,
            fontStyle: FontStyle.italic,
            color: Layout.warning()
          ),
          body1: TextStyle(fontSize: 14)
        )
      ),
      home: HomePage(),
    );
  }
}