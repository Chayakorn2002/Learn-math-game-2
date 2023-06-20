import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/const.dart';
import 'package:math_game/utils/my_button.dart';
import 'package:math_game/utils/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number pad list
  List<String> numpad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '',
    '0',
  ];

  List<bool> isCorrect = [false, false, false, false]; // maximum of 4
  int answerCount = 0;

  // numberA, numberB
  int numberA = Random().nextInt(10) + 1;
  int numberB = Random().nextInt(10) + 1;

  // user answer
  String userAnswer = '';

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        // check answer is correct or incorrect
        if (userAnswer.isNotEmpty) {
          checkResult();
        }
      } else if (button == 'C') {
        // clear answer
        userAnswer = '';
      } else if (button == 'DEL') {
        // delete last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        // maximum input
        userAnswer += button;
      }
    });
  }

  // check if answer is correct or not
  void checkResult() {
    // correct answer
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage.correct(
            numberA: numberA,
            numberB: numberB,
            onTap: goToNextQuestion,
            message: 'Correct!',
            isCorrect: true,
            icon: Icons.arrow_forward,
          );
        },
      );

      isCorrect[answerCount] = true;
      answerCount++;

      if (answerCount == 4) {
        // go to next level
      }
    }
    // wrong answer
    else {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage.wrong(
            numberA: numberA,
            numberB: numberB,
            onTap: goBackToQuestion,
            message: 'Try again!',
            isCorrect: false,
            icon: Icons.rotate_left,
            userAnswer: userAnswer,
          );
        },
      );

      isCorrect = [false];
      answerCount = 0;
    }
  }

  // create random numbers
  var randomNumber = Random();

  void goToNextQuestion() {
    // dismissing the alert dialog
    Navigator.pop(context);

    // reset Value
    setState(() {
      userAnswer = '';
    });

    // creating new question
    numberA = randomNumber.nextInt(10) + 1;
    numberB = randomNumber.nextInt(10) + 1;
  }

  void goBackToQuestion() {
    // dismissing the alert dialog
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 138, 255),
      body: Column(
        children: [
          // level progress
          Container(
            height: 175,
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (isCorrect[index]) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // question
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // question
                  Text(
                    '$numberA + $numberB = ',
                    style: whiteTextStyle,
                  ),

                  // answer box
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child:
                        Center(child: Text(userAnswer, style: whiteTextStyle)),
                  ),
                ],
              ),
            ),
          ),
          // numpad
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numpad.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numpad[index],
                    onTap: () => buttonTapped(numpad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
