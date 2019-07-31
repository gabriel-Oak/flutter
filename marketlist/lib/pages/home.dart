import 'package:flutter/material.dart';
import 'package:marketlist/layout.dart';

import 'about.dart';

class HomePage extends StatelessWidget {

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Bem vindo!'),
          RaisedButton(
            child: Text('Sobre'),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutPage.tag);
            },
          )
        ],
      ),
    );

    return Layout.getContent(context, content);
  }
}