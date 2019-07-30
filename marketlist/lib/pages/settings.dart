import 'package:flutter/material.dart';
import 'package:marketlist/layout.dart';

class SettingsPage extends StatelessWidget {

  static String tag = 'settings-page';

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