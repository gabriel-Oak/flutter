import 'package:flutter/material.dart';
import 'package:marketlist/layout.dart';

class AboutPage extends StatelessWidget {

  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(context, Center(
      child: Text(
        'Criado por alguém.',
        style:  TextStyle(
          color: Layout.dark()
        ),
      )
    ));
  }
}