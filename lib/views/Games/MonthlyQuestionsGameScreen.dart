import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Loader.dart';
import 'package:flutterTestApp/components/RegularCustomButton.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/views/Games/GamesListScreen.dart';

class MonthlyQuestionsGameScreen extends StatefulWidget {
  const MonthlyQuestionsGameScreen({Key key, this.monthId, this.language})
      : super(key: key);
  final int monthId;
  final String language;

  @override
  State<MonthlyQuestionsGameScreen> createState() =>
      _MonthlyQuestionsGameScreenState();
}

class _MonthlyQuestionsGameScreenState
    extends State<MonthlyQuestionsGameScreen> {
  bool loading = false;
  String selectedAnswer, activeQuestion;
  List<String> answersList = [];
  var gameItem;
  int activeQuestionIndex = 0;
  @override
  void initState() {
    getGameItem();
    super.initState();
  }

  getGameItem() {
    var foundPlantGame = monthsPlantGame.firstWhere(
        (game) => game["monthId"] == widget.monthId,
        orElse: () => null);
    var object = foundPlantGame[widget.language] as Map<String, dynamic>;
    if (foundPlantGame != null) {
      setState(() {
        gameItem = object;
      });
      resetAnswers();
    }
  }

  resetAnswers() {
    List<String> answers = [
      ...gameItem["questions"][activeQuestionIndex]["answers"]
    ];
    answers.shuffle();
    setState(() {
      answersList = answers;
    });
  }

  goToNextQuestion() {
    loading = true;
    if (activeQuestionIndex + 1 == gameItem["questions"].length) {
      displayDialog(true, true);
    } else {
      setState(() {
        activeQuestionIndex = activeQuestionIndex + 1;
        resetAnswers();
        loading = false;
      });
    }
  }

  changeSelection(answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  onAnswerSubmit() {
    if (selectedAnswer != null) {
      bool isCorrect = selectedAnswer ==
          gameItem["questions"][activeQuestionIndex]["correctAnswer"];
      displayDialog(isCorrect, false);
    }
  }

  displayDialog(isCorrect, isFinishDialog) {
    bool isCorrectAnswer = isCorrect && !isFinishDialog;
    bool isIncorrectAnswer = !isCorrect && !isFinishDialog;
    onPress() {
      if (isCorrectAnswer || isIncorrectAnswer) {
        Navigator.pop(context);
        goToNextQuestion();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GamesList(),
          ),
        );
      }
    }

    var text = isCorrectAnswer
        ? "Atbilde ir pareiza!"
        : isIncorrectAnswer
            ? 'Atbilde ir nepareiza! Pareizā atbilde ir "${gameItem["questions"][activeQuestionIndex]["correctAnswer"]}"'
            : "Jautājumi beigušies";
    var showSuccess = isCorrectAnswer || isFinishDialog;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new CupertinoAlertDialog(
        content: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    onPress();
                  },
                  child: Icon(Icons.close),
                ),
              ],
            ),
            Icon(
              showSuccess
                  ? Icons.check_circle_outline
                  : Icons.warning_amber_outlined,
              size: 50,
              color: showSuccess ? Colors.green : Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: showSuccess ? Colors.green : Colors.red),
              ),
            ),
            RegularCustomButton(
              text: "Turpināt",
              onPress: () {
                onPress();
              },
              backgroundColor: showSuccess ? Colors.green : Colors.red,
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
              borderWidth: 0,
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: '"Mēnešu spēle"',
      goBack: true,
      child: loading || gameItem == null
          ? Loader()
          : Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      gameItem["questions"][activeQuestionIndex]["question"]
                          .toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: answersList
                        .map(
                          (answer) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: RegularCustomButton(
                              onPress: () => changeSelection(answer),
                              text: answer,
                              backgroundColor: selectedAnswer == answer
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RegularCustomButton(
                      onPress: () => onAnswerSubmit(),
                      text: getTranslation(context, "submit_answer"),
                      backgroundColor:
                          selectedAnswer != null ? kDefaultColor : Colors.grey,
                      borderWidth: 0,
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: selectedAnswer != null
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  RegularCustomButton(
                    onPress: () => goToNextQuestion(),
                    text: getTranslation(context, "skip"),
                    backgroundColor: Colors.red,
                    borderWidth: 0,
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
