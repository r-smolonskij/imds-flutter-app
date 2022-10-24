import 'package:flutter/material.dart';
import 'package:flutterTestApp/views/SingleTranslationScreen.dart';
import 'package:flutterTestApp/constants.dart';

class SearchResultsListItem extends StatelessWidget {
  const SearchResultsListItem(
      {Key key,
      this.title,
      this.translationWordID,
      this.onPressed,
      this.language})
      : super(key: key);
  final String title, language;
  final translationWordID;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    var flagName = language == "la"
        ? 'latin'
        : language == 'lv'
            ? 'latvian'
            : language == 'en'
                ? 'uk'
                : language == 'de'
                    ? 'german'
                    : language == 'ru'
                        ? 'russian'
                        : "";
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleTranslationScreen(translationWordID),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            border: Border.all(color: kDefaultColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //width is needed if you have icon at right side
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  title != null ? title : "",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kDefaultColor,
                  ),
                ),
              ),
              flagName != ""
                  ? Image.asset(
                      "assets/images/${flagName}_flag_circular.png",
                      height: 35,
                    )
                  : Icon(
                      Icons.launch_outlined,
                      color: kDefaultColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
