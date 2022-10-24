import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Loader.dart';
import 'package:flutterTestApp/components/RegularCustomButton.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/sqlite/translation.dart';

class PutTogetherGameScreen extends StatefulWidget {
  const PutTogetherGameScreen(
      {Key key, this.firstLanguage, this.secondLanguage})
      : super(key: key);

  final String firstLanguage, secondLanguage;

  @override
  State<PutTogetherGameScreen> createState() => _PutTogetherGameScreenState();
}

class _PutTogetherGameScreenState extends State<PutTogetherGameScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Translation> allTranslations = [];
  var allTranslationsIds = [];
  List<Translation> answerOptions = [];
  Translation resultOption;
  final _random = new Random();
  bool loading = false;
  Translation selectedAnswer;

  getAllTranslations() {
    loading = true;
    dbHelper.getAllTranslations().then((translations) {
      var filteredTranslations = translations
          .where((translation) =>
              translation.toJson()[widget.secondLanguage] != null &&
              translation.toJson()[widget.firstLanguage] != null)
          .toList();
      setState(() {
        allTranslations = filteredTranslations;
      });
      getRoundOptions();
    });
  }

  getRoundOptions() {
    loading = true;
    List<Translation> options = [];
    Translation resultItem =
        allTranslations[_random.nextInt(allTranslations.length)];
    List<Translation> filteredTranslations = allTranslations
        .where((translation) =>
            translation.translation_group != resultItem.translation_group)
        .toList();
    options.add(resultItem);
    options.addAll([
      filteredTranslations[_random.nextInt(filteredTranslations.length)],
      filteredTranslations[_random.nextInt(filteredTranslations.length)],
      filteredTranslations[_random.nextInt(filteredTranslations.length)],
    ]);
    options.shuffle();
    setState(() {
      resultOption = resultItem;
      answerOptions = options;
      loading = false;
    });
  }

  changeSelectedAnswer(option) async {
    setState(() {
      selectedAnswer = option;
    });
  }

  goToNextQuestion() {
    loading = true;
    setState(() {
      answerOptions = [];
      resultOption = null;
      selectedAnswer = null;
    });
    getRoundOptions();
  }

  onAnswerSubmit() {
    if (selectedAnswer != null) {
      bool isCorrect = resultOption == selectedAnswer;
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
                      Navigator.pop(context);
                      goToNextQuestion();
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              Icon(
                isCorrect
                    ? Icons.check_circle_outline
                    : Icons.warning_amber_outlined,
                size: 50,
                color: isCorrect ? Colors.green : Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  isCorrect
                      ? "Atbilde ir pareiza!"
                      : 'Atbilde ir nepareiza! Pareizā atbilde ir "${resultOption.toJson()[widget.secondLanguage]}"',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isCorrect ? Colors.green : Colors.red),
                ),
              ),
              RegularCustomButton(
                text: "Turpināt",
                onPress: () {
                  Navigator.pop(context);
                  goToNextQuestion();
                },
                backgroundColor: isCorrect ? Colors.green : Colors.red,
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
  }

  @override
  void initState() {
    getAllTranslations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: '"Saliec kopā"',
      goBack: true,
      child: loading || resultOption == null
          ? Loader()
          : Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          flagsByCountryCode[widget.firstLanguage],
                          height: 32,
                        ),
                        Icon(
                          Icons.arrow_right_alt_sharp,
                          size: 32,
                        ),
                        Image.asset(
                          flagsByCountryCode[widget.secondLanguage],
                          height: 32,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      resultOption.toJson()[widget.firstLanguage],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: answerOptions
                        .where((option) =>
                            option.toJson()[widget.secondLanguage] != null)
                        .map(
                          (option) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: RegularCustomButton(
                              onPress: () => changeSelectedAnswer(option),
                              text: option.toJson()[widget.secondLanguage],
                              backgroundColor: selectedAnswer == option
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
