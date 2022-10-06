import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/views/Games/GameSettingsScreen.dart';

class GamesListItem extends StatelessWidget {
  const GamesListItem({Key key, this.gameType}) : super(key: key);
  final String gameType;

  @override
  Widget build(BuildContext context) {
    var haveTitle = gamesList[gameType] != null;

    return !haveTitle
        ? SizedBox()
        : GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameSettingsScreen(gameType: gameType),
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: kDefaultColor),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  gamesList[gameType],
                  style: TextStyle(
                    fontSize: 22,
                    color: kDefaultColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
  }
}
