import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      print('tada');
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AlertDialog(
          backgroundColor: Colors.deepPurple,
          content: SizedBox(
            height: 302,
            child: Column(
              children: [
                // Lottie.network(
                //     'https://assets2.lottiefiles.com/packages/lf20_QLAqiXI9Pm.json'),
                Lottie.asset('assets/lotties/correct.json'),
              ],
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: AlertDialog(
          backgroundColor: Colors.deepPurple,
          content: SizedBox(
            height: 302,
            child: Column(
              children: [
                // Lottie.network(
                //     'https://assets7.lottiefiles.com/packages/lf20_1zvbfarz.json',
                //     ),
                Lottie.asset('assets/lotties/incorrect.json'),
              ],
            ),
          ),
        ),
      );
    }
  }
}
