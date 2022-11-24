import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';

showAlertDialog(context, text) {
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
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close),
              ),
            ],
          ),
          Icon(
            Icons.warning_amber_outlined,
            size: 50,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 30,
              child: Center(
                child: Text(
                  getTranslation(context, "return"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    ),
  );
}

getTranslation(context, codeName) {
  return AppLocalizations.of(context).translate(codeName).toString();
}

getTranslationByLanguage(context, codeName, languageCode) async {
  var result = await AppLocalizations.of(context)
      .translateByLanguageCode(codeName, languageCode);
  return result;
}
