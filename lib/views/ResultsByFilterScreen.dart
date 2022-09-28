import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutterTestApp/models/models.dart';
import 'dart:io';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/views/SingleTranslationScreen.dart';

class ResultsByFilterScreen extends StatefulWidget {
  ResultsByFilterScreen({
    this.plantType,
    this.flowersColorsList,
    this.fruitsColorsList,
    this.needlesColorsList,
    this.leafsColorsList,
    this.floweringMonthsList,
  });

  final List plantType;
  final List flowersColorsList,
      fruitsColorsList,
      needlesColorsList,
      floweringMonthsList,
      leafsColorsList;

  @override
  _ResultsByFilterScreenState createState() => _ResultsByFilterScreenState();
}

class _ResultsByFilterScreenState extends State<ResultsByFilterScreen> {
  var flowerColors = [];
  var textsList = [];
  var _store;
  @override
  void initState() {
    if (widget.fruitsColorsList.length > 0) {
      textsList.add("Augļu krāsa ");
    }
    if (widget.floweringMonthsList.length > 0) {
      textsList.add("Ziedēšānas laiks ");
    }
    if (widget.leafsColorsList.length > 0) {
      textsList.add("Lapu krāsa ");
    }
    if (widget.flowersColorsList.length > 0) {
      textsList.add("Ziedu krāsa ");
    }
    if (widget.needlesColorsList.length > 0) {
      textsList.add("Skuju krāsa ");
    }
    if (widget.plantType.length > 0) {
      textsList.add("Auga tips ");
    }
    super.initState();
  }

  var wordsList = [
    // "cīrulīši",
    // "doronikas",
    // "krokusi",
    // "ligulārijas",
    // "naktssveces",
    // "prīmulas",
    // "rasaskrēsliņi",
    // "rudbekijas",
    // "saulesactiņas",
    // "zeltslotiņas",
    // "krāšņā telēkija",
    // "Ķīnas saulpurene"
  ];
  List<int> searchByColorIDs(
      String colorGroup, List colorsList, List availableIDsList) {
    List<int> searchColorsIDs = [];
    var colorsBox;

    colorsList.map((e) {
      searchColorsIDs.add(e[0]);
    }).toList();

    switch (colorGroup) {
      case "flowersColors":
        colorsBox = _store.box<TranslationWithFlowersColor>();
        break;
      case "leafsColors":
        colorsBox = _store.box<TranslationWithLeafsColor>();
        break;
      case "fruitsColors":
        colorsBox = _store.box<TranslationWithFruitsColor>();
        break;
      case "needlesColors":
        colorsBox = _store.box<TranslationWithNeedlesColor>();
        break;
    }
    var translationsIDsAfterQuery;
    if (searchColorsIDs.length > 0) {
      var translationsWithFlowersColorsQuery = colorsBox
          .query(TranslationWithFlowersColor_.translationID
              .inside(availableIDsList)
              .and(
                  TranslationWithFlowersColor_.colorID.inside(searchColorsIDs)))
          .build();
      var translationsWithFlowersColorsQueryResults =
          translationsWithFlowersColorsQuery
              .integerProperty(TranslationWithFlowersColor_.translationID)
                ..distinct = true;
      translationsIDsAfterQuery =
          translationsWithFlowersColorsQueryResults.find();
    } else {
      translationsIDsAfterQuery = availableIDsList;
    }
    return translationsIDsAfterQuery;
  }

  Future<dynamic> fetchData() async {
    var transBox,
        transPlantBox,
        transMonthBox,
        transFlowersColorsBox,
        transLeafsColorsBox,
        transFruitsColorsBox,
        translationsList = [];

    await getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transBox = _store.box<Translation>();
      transPlantBox = _store.box<TranslationWithPlantType>();
      transMonthBox = _store.box<TranslationWithMonths>();
      transFlowersColorsBox = _store.box<TranslationWithFlowersColor>();
      transLeafsColorsBox = _store.box<TranslationWithLeafsColor>();
      transFruitsColorsBox = _store.box<TranslationWithFruitsColor>();
      List<int> searchFloweringMonthsIDsList = [];
      widget.floweringMonthsList.map((e) {
        searchFloweringMonthsIDsList.add(e[0]);
      }).toList();

      var translationsWithPlantTypesQuery = transPlantBox
          .query(
              TranslationWithPlantType_.plantTypeID.equals(widget.plantType[1]))
          .build();
      var translationsWithPlantTypesQueryResults =
          translationsWithPlantTypesQuery
              .integerProperty(TranslationWithPlantType_.translationID)
                ..distinct = true;
      var translationsIDsAfterPlantTypesQuery =
          translationsWithPlantTypesQueryResults.find();
      print(translationsIDsAfterPlantTypesQuery);

      var translationsIDsAfterFlowerColorsQuery = searchByColorIDs(
          "flowersColors",
          widget.flowersColorsList,
          translationsIDsAfterPlantTypesQuery);
      print("translationsIDsAfterFlowerColorsQuery =" +
          translationsIDsAfterFlowerColorsQuery.toString());
      var translationsIDsAfterLeafsColorsQuery = searchByColorIDs("leafsColors",
          widget.leafsColorsList, translationsIDsAfterFlowerColorsQuery);
      print("translationsIDsAfterLeafsColorsQuery =" +
          translationsIDsAfterLeafsColorsQuery.toString());
      var translationsIDsAfterNeedlesColorsQuery = searchByColorIDs(
          "needlesColors",
          widget.needlesColorsList,
          translationsIDsAfterLeafsColorsQuery);
      print("translationsIDsAfterNeedlesColorsQuery =" +
          translationsIDsAfterNeedlesColorsQuery.toString());
      var translationsIDsAfterFruitsColorsQuery = searchByColorIDs(
          "fruitsColors",
          widget.fruitsColorsList,
          translationsIDsAfterNeedlesColorsQuery);
      print("translationsIDsAfterFruitsColorsQuery =" +
          translationsIDsAfterFruitsColorsQuery.toString());

      var translationsIDsAfterTranslationsWithMonthsQuery;

      if (searchFloweringMonthsIDsList.length > 0) {
        var translationsWithMonthsQuery = transMonthBox
            .query(TranslationWithMonths_.translationID
                .inside(translationsIDsAfterFruitsColorsQuery)
                .and(TranslationWithMonths_.monthNumber
                    .inside(searchFloweringMonthsIDsList)))
            .build();

        var translationsWithMonthsQueryResults = translationsWithMonthsQuery
            .integerProperty(TranslationWithMonths_.translationID)
              ..distinct = true;
        translationsIDsAfterTranslationsWithMonthsQuery =
            translationsWithMonthsQueryResults.find();
      } else {
        translationsIDsAfterTranslationsWithMonthsQuery =
            translationsIDsAfterFruitsColorsQuery;
      }

      translationsList = transBox
          .query(Translation_.id
              .inside(translationsIDsAfterTranslationsWithMonthsQuery)
              .and(Translation_.showLV.equals(true)))
          .build()
          .find();
    });
    return translationsList;
  }

  @override
  Widget build(BuildContext context) {
    var lettersCount = 0;
    textsList.map((e) {
      if (e.length > lettersCount) {
        lettersCount = e.length;
      }
    }).toList();

    return DefaultView(
      title: "Rezultāti pēc filtrācijas",
      goBack: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    gradient: kDefaultLinearGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.plantType.length != 0
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: lettersCount * 9.0,
                                          decoration: BoxDecoration(
                                            gradient: kDefaultLinearGradient,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: Text(
                                                "Auga tips",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Flexible(
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  widget.plantType.length != 0
                                                      ? widget.plantType[0]
                                                      : "",
                                                  // overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            : SizedBox(height: 0),
                        ListWithColouredCircles(
                            lettersCount: lettersCount,
                            title: "Ziedu krāsa",
                            colorsList: widget.flowersColorsList),
                        ListWithText(
                          lettersCount: lettersCount,
                          title: "Ziedēšanas laiks",
                          textsList: widget.floweringMonthsList,
                        ),
                        ListWithColouredCircles(
                            lettersCount: lettersCount,
                            title: "Lapu krāsa",
                            colorsList: widget.leafsColorsList),
                        ListWithColouredCircles(
                            lettersCount: lettersCount,
                            title: "Skuju krāsa",
                            colorsList: widget.needlesColorsList),
                        ListWithColouredCircles(
                            lettersCount: lettersCount,
                            title: "Augļu krāsa",
                            colorsList: widget.fruitsColorsList),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Translation> wordsList = snapshot.data;

                      return wordsList.length == 0
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Netika atrasts neviens rezultāts pēc Jūsu izvēlētajiem filtriem",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: FlatButton(
                                      height: 45,
                                      child: Text(
                                        'Atgriezties',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFC2BE66),
                                        ),
                                      ),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side: BorderSide(
                                              color: Colors.white, width: 2)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: wordsList
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kDefaultColor, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleTranslationScreen(
                                                            e.id),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                //width is needed if you have icon at right side
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                child: Text(
                                                  '${e.lv}',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color: kDefaultColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.launch_outlined,
                                              color: kDefaultColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListWithText extends StatelessWidget {
  const ListWithText(
      {Key key, @required this.lettersCount, this.textsList, this.title})
      : super(key: key);

  final int lettersCount;
  final List textsList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return textsList.length != 0
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: lettersCount * 9.0,
                            decoration: BoxDecoration(
                              gradient: kDefaultLinearGradient,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: textsList.map((e) {
                            bool isLast =
                                textsList.indexOf(e) + 1 == textsList.length
                                    ? true
                                    : false;
                            return Text(
                              isLast == true ? "${e[1]}" : '${e[1]}, ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                )),
          )
        : SizedBox(
            height: 0,
          );
  }
}

class ListWithColouredCircles extends StatelessWidget {
  const ListWithColouredCircles(
      {Key key, @required this.lettersCount, this.colorsList, this.title})
      : super(key: key);

  final int lettersCount;
  final List colorsList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return colorsList.length != 0
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: lettersCount * 9.0,
                            decoration: BoxDecoration(
                              gradient: kDefaultLinearGradient,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: colorsList.map((e) {
                            return ColorCircle(
                              colorCode: e[2],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                )),
          )
        : SizedBox(
            height: 0,
          );
  }
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key key, this.colorCode}) : super(key: key);
  final String colorCode;
  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Container(
        height: 17,
        width: 17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          color: hexToColor('#' + colorCode),
        ),
      ),
    );
  }
}
