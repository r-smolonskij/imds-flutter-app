import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Loader.dart';
import 'package:flutterTestApp/components/RegularCustomButton.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/sqlite/translation.dart';

class WriteCorrectGameScreen extends StatefulWidget {
  const WriteCorrectGameScreen(
      {Key key, this.firstLanguage, this.secondLanguage})
      : super(key: key);

  final String firstLanguage, secondLanguage;

  @override
  State<WriteCorrectGameScreen> createState() => _WriteCorrectGameScreenState();
}

class _WriteCorrectGameScreenState extends State<WriteCorrectGameScreen> {
  var answerTextController = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Translation> allTranslations = [];
  var allTranslationsIds = [];
  Translation resultOption;
  final _random = new Random();
  bool loading = false;
  String writtenAnswer = "";
  List<String> correctAnswersList = [];

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
    Translation resultItem =
        allTranslations[_random.nextInt(allTranslations.length)];
    List<Translation> options = allTranslations
        .where((translation) =>
            translation.id != resultItem.id &&
            translation.translation_group == resultItem.translation_group)
        .toList();
    options.add(resultItem);
    List<String> optionsTexts = [];
    options.forEach((translation) {
      if (!optionsTexts.contains(
          translation.toJson()[widget.secondLanguage].toLowerCase().trim())) {
        optionsTexts.add(
            translation.toJson()[widget.secondLanguage].toLowerCase().trim());
      }
    });
    print(optionsTexts);
    setState(() {
      loading = false;
      resultOption = resultItem;
      correctAnswersList = optionsTexts;
    });
  }

  goToNextQuestion() {
    loading = true;
    answerTextController.clear();
    setState(() {
      resultOption = null;
      writtenAnswer = "";
    });
    getRoundOptions();
  }

  onAnswerSubmit() {
    if (writtenAnswer.length > 0) {
      bool isCorrect =
          correctAnswersList.contains(writtenAnswer.toLowerCase().trim());
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
                      : 'Atbilde ir nepareiza! Pareizo atbilžu varianti ir šādi:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isCorrect ? Colors.green : Colors.red),
                ),
              ),
              !isCorrect
                  ? Column(
                      children: correctAnswersList
                          .map((answer) => Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Icon(Icons.check,
                                          color: Colors.green),
                                    ),
                                    Text(
                                      answer,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RegularCustomButton(
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
              ),
            ]),
          ),
        ),
      );
    }
  }

  _setAnswerText(value) {
    setState(() {
      writtenAnswer = value;
    });
  }

  @override
  void initState() {
    getAllTranslations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: '"Uzraksti pareizi"',
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
                  TextField(
                    minLines: 1,
                    controller: answerTextController,
                    onChanged: (value) => _setAnswerText(value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.psychology,
                        color: kDefaultColor,
                      ),
                      suffixIcon: writtenAnswer != ""
                          ? GestureDetector(
                              onTap: () {
                                answerTextController.clear();
                                _setAnswerText("");
                              },
                              child: Icon(Icons.cancel_outlined,
                                  color: kDefaultColor),
                            )
                          : SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      fillColor: kDefaultColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kDefaultColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: kDefaultColor, width: 2)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RegularCustomButton(
                      onPress: () => onAnswerSubmit(),
                      text: "Iesniegt atbildi",
                      backgroundColor: writtenAnswer.length > 0
                          ? kDefaultColor
                          : Colors.grey,
                      borderWidth: 0,
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: writtenAnswer.length > 0
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  RegularCustomButton(
                    onPress: () => goToNextQuestion(),
                    text: "Izlaist",
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
