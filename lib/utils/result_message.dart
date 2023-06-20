import 'package:flutter/material.dart';
import 'package:math_game/const.dart';

class ResultMessage extends StatelessWidget {
  final int numberA;
  final int numberB;

  final String message;
  final icon;
  final VoidCallback onTap;

  final bool isCorrect;

  String? userAnswer;

  ResultMessage.correct({
    super.key,
    required this.numberA,
    required this.numberB,
    required this.onTap,
    required this.message,
    this.icon,
    required this.isCorrect,
  });

  ResultMessage.wrong(
      {super.key,
      required this.numberA,
      required this.numberB,
      required this.onTap,
      required this.message,
      this.icon,
      required this.isCorrect,
      required this.userAnswer});

  @override
  Widget build(BuildContext context) {
    if (isCorrect) {
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Text(
                  message,
                  style: whiteTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$numberA + $numberB = ${numberA + numberB}',
                  style: whiteTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    onPressed: onTap,
                  ),
                ),
              ],
            )),
      );
    } else {
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Text(
                  message,
                  style: whiteTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$numberA + $numberB ≠ $userAnswer',
                  style: whiteTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    onPressed: onTap,
                  ),
                ),
              ],
            )),
      );
    }
  }
}
