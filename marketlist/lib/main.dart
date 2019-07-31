import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/settings.dart';
import 'layout.dart';

void main() => runApp(MarketList());

class MarketList extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    SettingsPage.tag: (context) => SettingsPage()
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
            fontSize: 24,
            color: Layout.primary()
          ),
          body1: TextStyle(fontSize: 14)
        )
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}