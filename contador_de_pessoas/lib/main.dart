import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Contador de Pessoas',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _adviseText = 'Pode Entrar!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people > 10) {
        _adviseText = 'Lotado!!!';
      } else if (_people < 0) {
        _adviseText = 'Mundo Invertido?';
      } else {
        _adviseText = 'Pode Entrar!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      '-1',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      '+1',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _adviseText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
