import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Games/LanguageDropdownButton.dart';
import 'package:flutterTestApp/components/Games/MonthDropdownButton.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/views/Games/MonthlyQuestionsGameScreen.dart';
import 'package:flutterTestApp/views/Games/PutTogetherGameScreen.dart';
import 'package:flutterTestApp/views/Games/WriteCorrectGameScreen.dart';

class GameSettingsScreen extends StatefulWidget {
  const GameSettingsScreen({this.gameType, Key key}) : super(key: key);

  final String gameType;

  @override
  State<GameSettingsScreen> createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  var now = DateTime.now();
  //START monthlyQuestionsGameSettings
  var mqLanguage;
  var mqMonth;
  List<String> mqAvailableLanguages = [];
  changeMqLanguage(newLanguage) {
    setState(() {
      mqLanguage = newLanguage;
    });
  }

  changeMqMonth(monthId) {
    setState(() {
      mqAvailableLanguages = [];
      mqLanguage = null;
    });
    var foundMonthQuestions = monthsPlantGame
        .firstWhere((gameItem) => gameItem["monthId"] == monthId);
    var languagesCodes = ["lv", "en", "ru", "de"];
    if (foundMonthQuestions != null) {
      var languages = [];
      languagesCodes.forEach((code) {
        if (foundMonthQuestions[code] != null) {
          languages.add(code);
        }
      });
      setState(() {
        mqAvailableLanguages = [...languages];
      });
    }
    setState(() {
      mqMonth = monthId;
    });
  }

  //END monthlyQuestionsGameSettings
  //START PutTogetherGameSettings
  var ptFirstLanguage;
  var ptSecondLanguage;
  changePtLanguage(newLanguage, isFirst) {
    setState(() {
      if (isFirst) {
        ptFirstLanguage = newLanguage;
        if (newLanguage == ptSecondLanguage) {
          ptSecondLanguage = null;
        }
      } else {
        ptSecondLanguage = newLanguage;
      }
    });
  }

  //END PutTogetherGameSettings
  //START WriteCorrectGameSettings
  var wcFirstLanguage;
  var wcSecondLanguage;
  changeWcLanguage(newLanguage, isFirst) {
    setState(() {
      if (isFirst) {
        wcFirstLanguage = newLanguage;
        if (wcSecondLanguage == newLanguage) {
          wcSecondLanguage = null;
        }
      } else {
        wcSecondLanguage = newLanguage;
      }
    });
  }

  //END WriteCorrectGameSettings
  onButtonClick() {
    var screenToNavigate;
    if (widget.gameType == "monthlyQuestions" &&
        mqLanguage != null &&
        mqMonth != null) {
      screenToNavigate = MonthlyQuestionsGameScreen(
        monthId: mqMonth,
        language: mqLanguage,
      );
    } else if (widget.gameType == "putTogether" &&
        ptFirstLanguage != null &&
        ptSecondLanguage != null) {
      screenToNavigate = PutTogetherGameScreen(
        firstLanguage: ptFirstLanguage,
        secondLanguage: ptSecondLanguage,
      );
    } else if (widget.gameType == "writeCorrect" &&
        wcFirstLanguage != null &&
        wcSecondLanguage != null) {
      screenToNavigate = WriteCorrectGameScreen(
        firstLanguage: wcFirstLanguage,
        secondLanguage: wcSecondLanguage,
      );
    } else {
      showAlertDialog(context, "Lūdzu aizpildiet visus laukus!");
    }
    if (screenToNavigate != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screenToNavigate,
        ),
      );
    }
  }

  @override
  void initState() {
    changeMqMonth(now.month);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: "Spēles iestatījumi",
      goBack: true,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                '"${gamesList[widget.gameType]}" iestatījumi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            monthlyQuestionsGameSettings(),
            putTogetherGameSettings(),
            writeCorrectGameSettings(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () => onButtonClick(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: kDefaultColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Sākt spēli",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: kDefaultColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget monthlyQuestionsGameSettings() {
    return widget.gameType == "monthlyQuestions"
        ? Column(
            children: [
              MonthDropdownButton(
                selectedMonthId: mqMonth,
                onChange: (monthId) => changeMqMonth(monthId),
              ),
              mqMonth != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: LanguageDropdownButton(
                        selectedLanguage: mqLanguage,
                        onChange: (newLanguage) =>
                            changeMqLanguage(newLanguage),
                        availableLanguages: mqAvailableLanguages,
                      ),
                    )
                  : SizedBox(),
            ],
          )
        : SizedBox();
  }

  Widget putTogetherGameSettings() {
    return widget.gameType == "putTogether"
        ? Column(
            children: [
              LanguageDropdownButton(
                hintText: "Pirmā valoda",
                selectedLanguage: ptFirstLanguage,
                onChange: (newLanguage) => changePtLanguage(newLanguage, true),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LanguageDropdownButton(
                  hintText: "Otrā valoda",
                  selectedLanguage: ptSecondLanguage,
                  onChange: (newLanguage) =>
                      changePtLanguage(newLanguage, false),
                  excludedLanguage: ptFirstLanguage,
                  isDisabled: ptFirstLanguage == null,
                ),
              ),
            ],
          )
        : SizedBox();
  }

  Widget writeCorrectGameSettings() {
    return widget.gameType == "writeCorrect"
        ? Column(
            children: [
              LanguageDropdownButton(
                hintText: "Pirmā valoda",
                selectedLanguage: wcFirstLanguage,
                onChange: (newLanguage) => changeWcLanguage(newLanguage, true),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LanguageDropdownButton(
                  hintText: "Otrā valoda",
                  selectedLanguage: wcSecondLanguage,
                  onChange: (newLanguage) =>
                      changeWcLanguage(newLanguage, false),
                  excludedLanguage: wcFirstLanguage,
                  isDisabled: wcFirstLanguage == null,
                ),
              ),
            ],
          )
        : SizedBox();
  }
}
