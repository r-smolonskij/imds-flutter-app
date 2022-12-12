import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/ExpansionItem.dart';
import 'package:flutterTestApp/components/SingleTranslation/ImageDialog.dart';
import 'package:flutterTestApp/components/SingleTranslation/InternetSource.dart';
import 'package:flutterTestApp/components/SingleTranslation/PlantBodyPartColorsList.dart';
import 'package:flutterTestApp/components/SingleTranslation/SimpleInfoBox.dart';
import 'package:flutterTestApp/components/SingleTranslation/TranslationListItem.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/sqlite/translation.dart';

class SingleTranslationScreen extends StatefulWidget {
  SingleTranslationScreen(this.translationID);

  final int translationID;

  @override
  _SingleTranslationScreenState createState() =>
      _SingleTranslationScreenState();
}

class _SingleTranslationScreenState extends State<SingleTranslationScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  Translation translationItem;
  bool loading = false;
  var shortcutsListText = "";
  List<Translation> translations = [];
  Translation mainTranslation;
  @override
  void initState() {
    getData();
    getShortcutText();
    super.initState();
  }

  getShortcutText() {
    var text = "";
    shortcutsList.forEach((shortcut) {
      var index = shortcutsList.indexOf(shortcut);
      text += "${index > 0 ? ', ' : ""}${shortcut[0]} - ${shortcut[1]}";
    });
    setState(() {
      shortcutsListText = text;
    });
  }

  getData() {
    loading = true;
    dbHelper.getTranslationById(widget.translationID).then((translation) {
      print(translation.translation_group);
      dbHelper
          .getTranslationsByTranslationGroup(translation.translation_group)
          .then((translationsList) => {
                setState(() {
                  translations = translationsList;
                  mainTranslation = translationsList[0];
                })
              });
    });
    loading = false;
  }

  var shortcutsList = [
    ['f', 'feminium'],
    ['m', 'maskulinium'],
    ['n', 'neutrum'],
    ['pl', 'pluralis'],
    ['sg', 'singularis'],
  ];

  @override
  Widget build(BuildContext context) {
    var typesList = [
      [getTranslation(context, "genus"), Colors.green],
      [getTranslation(context, "subgenus"), Colors.yellow],
      [getTranslation(context, "species"), Colors.blue],
      [getTranslation(context, "subspecies"), Colors.purple],
      [getTranslation(context, "variety"), Colors.brown],
      [getTranslation(context, "form"), Colors.red],
      [getTranslation(context, "variety_group"), Colors.pink],
    ];
    return DefaultView(
      title: "",
      goBack: true,
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  loading
                      ? CircularProgressIndicator()
                      : translations != null && translations.length > 0
                          ? Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SimpleInfoBox(
                                          translation: mainTranslation),
                                      ImageDialog(
                                        imageName: mainTranslation.la,
                                      ),
                                    ],
                                  ),
                                  TranslationListItem(
                                      language: 'la',
                                      translationsList: translations),
                                  TranslationListItem(
                                      language: 'lv',
                                      translationsList: translations),
                                  TranslationListItem(
                                      language: 'en',
                                      translationsList: translations),
                                  TranslationListItem(
                                      language: 'ru',
                                      translationsList: translations),
                                  TranslationListItem(
                                      language: 'de',
                                      translationsList: translations),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: [
                                        PlantBodyPartColorsList(
                                            translationID: mainTranslation.id,
                                            type: "flower"),
                                        PlantBodyPartColorsList(
                                            translationID: mainTranslation.id,
                                            type: "foliage"),
                                        PlantBodyPartColorsList(
                                            translationID: mainTranslation.id,
                                            type: "fruit")
                                      ],
                                    ),
                                  ),
                                  ExpansionItem(
                                    title: "TEZAURS",
                                    description:
                                        mainTranslation.tezaurs_definition,
                                    url: mainTranslation.tezaurs_url,
                                    urlMask: "TEZAURS URL",
                                  ),
                                  InternetSource(
                                    sourceTitle: "WIKI",
                                    sourceUrl: mainTranslation.image_url,
                                  ),
                                  InternetSource(
                                    sourceTitle: "TEZAURS",
                                    sourceUrl: mainTranslation.tezaurs_url,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      shortcutsListText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  TypesList(
                                    typesList: typesList,
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypesList extends StatelessWidget {
  const TypesList({
    this.typesList,
    Key key,
  }) : super(key: key);
  final List typesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: typesList
            .map((e) => Type(
                  color: e[1],
                  title: e[0],
                ))
            .toList(),
      ),
    );
  }
}

class Type extends StatelessWidget {
  const Type({
    this.color,
    this.title,
    Key key,
  }) : super(key: key);
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: 25,
              width: 25,
              color: color,
            ),
          ),
          Text(
            " - ${title}",
            style: TextStyle(fontSize: 19),
          ),
        ],
      ),
    );
  }
}
