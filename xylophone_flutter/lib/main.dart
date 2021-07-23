import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int numberSound) {
    final player = AudioCache();
    player.play('note$numberSound.wav');
  }

  Expanded buildKey({Color colorOfKey, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(soundNumber);
        },
        color: colorOfKey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(colorOfKey: Colors.red, soundNumber: 1),
                buildKey(colorOfKey: Colors.orange, soundNumber: 2),
                buildKey(colorOfKey: Colors.yellow, soundNumber: 3),
                buildKey(colorOfKey: Colors.green, soundNumber: 4),
                buildKey(colorOfKey: Colors.teal, soundNumber: 5),
                buildKey(colorOfKey: Colors.blue, soundNumber: 6),
                buildKey(colorOfKey: Colors.purple, soundNumber: 7),
              ]),
        ),
      ),
    );
  }
}
