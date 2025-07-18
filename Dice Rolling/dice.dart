import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  List<int> diceValues = [1];

  void resetDice() {
    setState(() {
      diceValues = [1];
    });
  }

  void rollDice() {
    setState(() {
      diceValues = List.generate(
        diceValues.length,
        (_) => Random().nextInt(6) + 1,
      );
    });
  }

  void addDice() {
    if (diceValues.length < 6) {
      setState(() {
        diceValues.add(Random().nextInt(6) + 1);
      });
    }
  }

  void decreaseDice() {
    if (diceValues.length > 1) {
      setState(() {
        diceValues.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Roll the Dice!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity, // Make container as wide as possible
          margin: EdgeInsets.symmetric(horizontal: 25), // Reduce margin
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.5 * 255).toInt()),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: diceValues
                    .map(
                      (value) => Image.asset(
                        'assets/dice-$value.png',
                        width: 100,
                        height: 100,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black26,
                elevation: 10,
              ),
              child: Icon(Icons.casino, size: 40, color: Colors.white),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: resetDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black26,
                elevation: 10,
              ),
              child: Icon(Icons.refresh, size: 40, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: addDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black26,
                elevation: 10,
              ),
              child: Icon(Icons.add, size: 40, color: Colors.white),
            ),
            SizedBox(width: 15),
            ElevatedButton(
              onPressed: decreaseDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black26,
                elevation: 10,
              ),
              child: Icon(Icons.remove, size: 40, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
