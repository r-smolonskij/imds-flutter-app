import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/main.dart';

class LanguageChooseModal extends StatefulWidget {
  @override
  _LanguageChooseModalState createState() => _LanguageChooseModalState();
}

class _LanguageChooseModalState extends State<LanguageChooseModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      // backgroundColor: kDefaultColor,
      child: Container(
        decoration: BoxDecoration(gradient: kDefaultLinearGradient),
        width: double.infinity,
        // height: 370,
        height: MediaQuery.of(context).size.height > 400
            ? MediaQuery.of(context).size.height * 0.5
            : 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: MediaQuery.of(context).size.height > 400
                          ? MediaQuery.of(context).size.height * 0.04
                          : 32,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)
                  .translate("choose_language")
                  .toString(),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height > 400
                    ? MediaQuery.of(context).size.height * 0.03
                    : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageItem(
                  title: "Latviešu",
                  flagPath: "assets/images/latvian_flag_circular.png",
                  langCodeFirst: "lv",
                  langCodeSecond: "LV",
                ),
                LanguageItem(
                  title: "English",
                  flagPath: "assets/images/uk_flag_circular.png",
                  langCodeFirst: "en",
                  langCodeSecond: "US",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageItem(
                  title: "Pусский",
                  flagPath: "assets/images/russian_flag_circular.png",
                  langCodeFirst: "ru",
                  langCodeSecond: "RU",
                ),
                LanguageItem(
                  title: "Deutsche",
                  flagPath: "assets/images/german_flag_circular.png",
                  langCodeFirst: "de",
                  langCodeSecond: "DE",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    this.title,
    this.flagPath,
    this.langCodeFirst,
    this.langCodeSecond,
    Key key,
  }) : super(key: key);
  final String title, flagPath, langCodeFirst, langCodeSecond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          print(Locale(langCodeFirst, langCodeSecond));
          MyApp.setLocale(context, Locale(langCodeFirst, langCodeSecond));
          Navigator.of(context).pop();
        },
        child: Container(
          width: MediaQuery.of(context).size.height > 400
              ? MediaQuery.of(context).size.height * 0.15
              : 100,
          padding: EdgeInsets.only(top: 5, bottom: 5),
          // decoration: BoxDecoration(
          //     border: Border.all(color: kSecondaryColor, width: 3),
          //     borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              if (flagPath != null)
                Image.asset(
                  flagPath,
                  height: MediaQuery.of(context).size.height > 400
                      ? MediaQuery.of(context).size.height * 0.1
                      : 70,
                  width: MediaQuery.of(context).size.height > 400
                      ? MediaQuery.of(context).size.height * 0.1
                      : 70,
                ),
              Text(
                title != null ? title : '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height > 400
                        ? MediaQuery.of(context).size.height * 0.024
                        : 18,
                    color: Colors.white),
              )
            ],
          ),
        ),
        // child: Container(
        //   padding: EdgeInsets.symmetric(vertical: 7),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       if (flagPath != null)
        //         Image.asset(
        //           flagPath,
        //           height: 20,
        //           width: 20,
        //         ),
        //       Padding(
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         child: Text(
        //           title != null ? title : '',
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
