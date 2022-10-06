import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/sqlite/translation.dart';

class TranslationListItem extends StatelessWidget {
  const TranslationListItem({Key key, this.language, this.translationsList})
      : super(key: key);
  final String language;
  final List<Translation> translationsList;
  @override
  Widget build(BuildContext context) {
    var imagePath = "assets/images/";
    var flagsList = {
      "lv": "latvian_flag_circular.png",
      "de": "german_flag_circular.png",
      "ru": "russian_flag_circular.png",
      "en": "uk_flag_circular.png",
      "la": "latin_flag_circular.png",
    };

    getTranslationsText() {
      var text = "";
      translationsList.forEach((translation) {
        var index = translationsList.indexOf(translation);
        switch (language) {
          case "lv":
            var showText = translation.lv != null &&
                ((index == 0) ||
                    (index > 0 && translation.lv != translationsList[0].lv));
            text += showText
                ? "${index > 0 ? ', ' : ""}${translation.lv} ${translation.lv_apz != null ? ' - ${translation.lv_apz}' : ''}"
                : "";
            break;
          case "de":
            var showText = translation.de != null &&
                ((index == 0) ||
                    (index > 0 && translation.de != translationsList[0].de));
            text += showText
                ? "${index > 0 ? ', ' : ""}${translation.de} ${translation.de_apz != null ? ' - ${translation.de_apz}' : ''}"
                : "";
            break;
          case "ru":
            var showText = translation.ru != null &&
                ((index == 0) ||
                    (index > 0 && translation.ru != translationsList[0].ru));
            text += showText
                ? "${index > 0 ? ', ' : ""}${translation.ru} ${translation.ru_apz != null ? ' - ${translation.ru_apz}' : ''}"
                : "";
            break;
          case "en":
            var showText = translation.en != null &&
                ((index == 0) ||
                    (index > 0 && translation.en != translationsList[0].en));
            text += showText ? "${index > 0 ? ', ' : ""}${translation.en}" : "";
            break;
          case "la":
            var showText = translation.la != null &&
                ((index == 0) ||
                    (index > 0 && translation.la != translationsList[0].la));
            text += showText ? "${index > 0 ? ', ' : ""}${translation.la}" : "";
            break;
        }
      });

      return text;
    }

    showBox() {
      var show = false;
      translationsList.forEach((translation) {
        if (language == 'lv' && translation.lv != null) {
          show = true;
        }
        if (language == 'de' && translation.de != null) {
          show = true;
        }
        if (language == 'ru' && translation.ru != null) {
          show = true;
        }
        if (language == 'en' && translation.en != null) {
          show = true;
        }
        if (language == 'la' && translation.la != null) {
          show = true;
        }
      });
      return show;
    }

    imagePath += flagsList[language];

    var colorsList = {
      "ģints": Colors.green,
      "apakšģints": Colors.yellow,
      "suga": Colors.blue,
      "pasuga": Colors.purple,
      "varietāte": Colors.brown,
      "forma": Colors.red,
      "šķirnu grupa": Colors.pink
    };

    var translationColor = colorsList[translationsList[0].notes] != null
        ? colorsList[translationsList[0].notes]
        : Colors.white;

    return showBox()
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              decoration: BoxDecoration(
                  gradient: kDefaultLinearGradient,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Image.asset(
                      imagePath,
                      width: 40,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${getTranslationsText()}",
                      style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: translationColor),
                    ),
                  )
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
