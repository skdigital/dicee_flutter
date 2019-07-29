import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade500,
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 2;
  int rightDiceNumber = 5;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Dice(
                diceImage: 'dice$leftDiceNumber.png',
                title: 'Dice 1',
                onPressed: () {
                  print('dice 1 rolled');
                  setState(() {
                    rollDice();
                  });
                },
              ),
            ),
            Expanded(
              child: Dice(
                diceImage: 'dice$rightDiceNumber.png',
                title: 'Dice 2',
                onPressed: () {
                  print('dice 2 rolled');
                  setState(() {
                    rollDice();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  Dice(
      {@required this.diceImage,
      @required this.title,
      @required this.onPressed});

  final String diceImage;
  final String title;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          onPressed();
        },
        child: Image.asset('images/$diceImage'),
      ),
    );
  }
}
