import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Games/GamesListItem.dart';
import 'package:flutterTestApp/components/Games/LanguageDropdownButton.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/funtions.dart';

class GamesList extends StatefulWidget {
  const GamesList({Key key}) : super(key: key);

  @override
  State<GamesList> createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2

  dropdownCallBack(String selectedValue) {}

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: getTranslation(context, "games_list"),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            GamesListItem(gameType: "monthlyQuestions"),
            GamesListItem(gameType: "putTogether"),
            GamesListItem(gameType: "writeCorrect"),
          ],
        ),
      ),
    );
  }
}
