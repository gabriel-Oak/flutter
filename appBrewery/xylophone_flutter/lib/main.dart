import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: musicalButton(1, Colors.red)),
              Expanded(child: musicalButton(2, Colors.orange)),
              Expanded(child: musicalButton(3, Colors.yellow)),
              Expanded(child: musicalButton(4, Colors.green)),
              Expanded(child: musicalButton(5, Colors.green[900])),
              Expanded(child: musicalButton(6, Colors.blue)),
              Expanded(child: musicalButton(7, Colors.purple)),
            ],
          ),
        ),
      ),
    );
  }

  void playAudio(int index) {
    final player = AudioCache();
    player.play('note$index.wav');
  }

  FlatButton musicalButton(int indice, Color cor) {
    return FlatButton(
      onPressed: () => playAudio(indice),
      child: null,
      color: cor,
    );
  }
}
