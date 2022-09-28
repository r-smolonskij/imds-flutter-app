import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class SingleTranslationScreen extends StatefulWidget {
  SingleTranslationScreen(this.translationID);

  final int translationID;

  @override
  _SingleTranslationScreenState createState() =>
      _SingleTranslationScreenState();
}

class _SingleTranslationScreenState extends State<SingleTranslationScreen> {
  Translation translation;
  var _store,
      transBox,
      plantTypeBox,
      transFlowerColorsBox,
      customColorsBox,
      transNeedlesColorsBox,
      transLeafsColorsBox,
      transPlantBox;

  @override
  void initState() {
    super.initState();
  }

  // Future getData() async {
  //   await getApplicationDocumentsDirectory().then((Directory dir) {
  //     _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
  //     var transPlantBox = _store.box<TranslationWithPlantType>();
  //     var ss = transPlantBox
  //         .query(TranslationWithPlantType_.translationID
  //             .equals(widget.translationID))
  //         .build();
  //   });
  // }

  var shortcutsList = [
    ['f', 'feminium'],
    ['m', 'maskulinium'],
    ['n', 'neutrum'],
    ['pl', 'pluralis'],
    ['sg', 'singularis'],
  ];
  var typesList = [
    ["ģints", Colors.green],
    ["apakšģints", Colors.yellow],
    ["suga", Colors.blue],
    ["pasuga", Colors.purple],
    ["varietāte", Colors.brown],
    ["forma", Colors.red],
    ["šķirņu grupa", Colors.pink],
  ];

  Future<dynamic> fetchData() async {
    var query,
        translation,
        wordsGroup,
        plantType,
        flowerColorsList = [],
        leafsColorsList = [],
        needlesColorsList = [];
    await getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transBox = _store.box<Translation>();
      plantTypeBox = _store.box<PlantType>();
      translation = transBox.get(widget.translationID);
      transFlowerColorsBox = _store.box<TranslationWithFlowersColor>();
      transLeafsColorsBox = _store.box<TranslationWithLeafsColor>();
      transPlantBox = _store.box<TranslationWithPlantType>();
      customColorsBox = _store.box<CustomColor>();

      //Start of Getting all Flower's colors
      var flowerColorsListResults = transFlowerColorsBox
          .query(TranslationWithFlowersColor_.translationID
              .equals(translation.wordsGroupId))
          .build()
          .find();

      flowerColorsListResults.map((e) {
        var colorModel = customColorsBox.get(e.colorID);
        flowerColorsList.add(colorModel);
      }).toList();
      //End of Getting all Flower's colors

      //Start of Getting all Leaf's colors
      var leafsColorsListResults = transLeafsColorsBox
          .query(TranslationWithLeafsColor_.translationID
              .equals(translation.wordsGroupId))
          .build()
          .find();

      leafsColorsListResults.map((e) {
        var colorModel = customColorsBox.get(e.colorID);
        leafsColorsList.add(colorModel);
      }).toList();
      //End of Getting all Leaf's colors
      var foundTransPlant = transPlantBox
          .query(TranslationWithPlantType_.translationID
              .equals(translation.wordsGroupId))
          .build()
          .findFirst();
      if (foundTransPlant != null) {
        var foundPlantType = plantTypeBox
            .query(PlantType_.id.equals(foundTransPlant.plantTypeID))
            .build()
            .findFirst();
        if (foundPlantType != null) {
          plantType = foundPlantType;
        }
      }

      // if (translation.plantTypeID != 0) {
      //   plantType = plantTypeBox.get(translation.plantTypeID);
      // }

      var secondQuery = transBox
          .query(Translation_.wordsGroupId.equals(translation.wordsGroupId))
          .build();
      wordsGroup = secondQuery.find();
    });
    var botanicDescriptions = [];
    String botanicDescriptionsText = "";
    if (wordsGroup.length > 0) {
      wordsGroup.map((word) {
        var lv_apzArray = word.lv_apz.trim().split(',');
        var de_apzArray = word.de_apz.trim().split(',');
        var ru_apzArray = word.ru_apz.trim().split(',');
        var all_apzArray = lv_apzArray + de_apzArray + ru_apzArray;
        all_apzArray.map((apzimejums) {
          var foundDescriptions = botanicDescriptions
              .where((element) => element[0] == apzimejums.trim())
              .toList();
          if (foundDescriptions.length == 0) {
            var apzList = shortcutsList
                .where((element) => element[0] == apzimejums.trim())
                .toList();
            if (apzList.length > 0) {
              botanicDescriptions.addAll(apzList);
            }
          }
        }).toList();
      }).toList();
      botanicDescriptions.map((e) {
        var index = botanicDescriptions.indexOf(e);
        if (index + 1 != botanicDescriptions.length) {
          botanicDescriptionsText =
              botanicDescriptionsText + e[0] + " - " + e[1] + ", ";
        } else {
          botanicDescriptionsText =
              botanicDescriptionsText + e[0] + " - " + e[1];
        }
      }).toList();
    }
    return [
      wordsGroup,
      plantType,
      flowerColorsList,
      leafsColorsList,
      botanicDescriptionsText
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    child: FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var foundType = typesList
                              .where((element) =>
                                  element[0] == snapshot.data[0][0].piezimes)
                              .toList();

                          var latvianList = snapshot.data[0]
                              .where((e) => e.showLV == true)
                              .toList();
                          var russianList = snapshot.data[0]
                              .where((e) => e.showRU == true)
                              .toList();
                          var germanList = snapshot.data[0]
                              .where((e) => e.showDE == true)
                              .toList();
                          var flowersColors =
                              snapshot.data[2].map((e) => e.colorCode).toList();
                          var leafsColors =
                              snapshot.data[3].map((e) => e.colorCode).toList();

                          return Container(
                            // child: Text('hasData: ${snapshot.data.en}')
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    snapshot.data[1] != null
                                        ? SimpleInfoBox(
                                            imagesList: [
                                              // "Piktogramma_lakstaugs_zals.png",
                                              // "Piktogramma_viengadiigs_2_zals.png"
                                              [
                                                snapshot.data[1].title,
                                                snapshot.data[1].id == 1
                                                    ? "Viengadīgs_lakstaugs.png"
                                                    : snapshot.data[1].id == 2
                                                        ? "Daudzgadīgs_lakstaugs.png"
                                                        : snapshot.data[1].id ==
                                                                3
                                                            ? "Lapu_krūms.png"
                                                            : snapshot.data[1]
                                                                        .id ==
                                                                    4
                                                                ? "Skuju_krūms.png"
                                                                : snapshot
                                                                            .data[
                                                                                1]
                                                                            .id ==
                                                                        5
                                                                    ? "Liāna.png"
                                                                    : snapshot.data[1].id ==
                                                                            6
                                                                        ? "Lapu_koks.png"
                                                                        : snapshot.data[1].id ==
                                                                                7
                                                                            ? "Skuju_koks.png"
                                                                            : "Telpaugs.png"
                                              ]
                                            ],
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              insetPadding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Icon(
                                                          Icons.close_rounded,
                                                          size: 32,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Image.asset(
                                                      "assets/images/tree.png"),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.image,
                                        color: kDefaultColor,
                                        size: 72,
                                      ),
                                    )
                                  ],
                                ),
                                TranslationListItem(
                                  language: "Latin",
                                  imagePath:
                                      "assets/images/latin_flag_circular.png",
                                  translationsList: [snapshot.data[0][0]],
                                  haveData: snapshot.data[0][0].la != null,
                                ),
                                TranslationListItem(
                                  language: "Latvian",
                                  imagePath:
                                      "assets/images/latvian_flag_circular.png",
                                  translationsList: latvianList,
                                  haveData: snapshot.data[0][0].lv != null,
                                ),
                                TranslationListItem(
                                  language: "Russian",
                                  imagePath:
                                      "assets/images/russian_flag_circular.png",
                                  translationsList: russianList,
                                  haveData: snapshot.data[0][0].ru != null,
                                ),
                                TranslationListItem(
                                  language: "English",
                                  imagePath:
                                      "assets/images/uk_flag_circular.png",
                                  translationsList: [snapshot.data[0][0]],
                                  haveData: snapshot.data[0][0].en != null,
                                ),
                                TranslationListItem(
                                  language: "German",
                                  imagePath:
                                      "assets/images/german_flag_circular.png",
                                  translationsList: germanList,
                                  haveData: snapshot.data[0][0].de != null,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    children: [
                                      flowersColors.length > 0
                                          ? InfoBoxWithColors(
                                              title: "Ziedu krāsa",
                                              imagePath:
                                                  "Piktogramma_zieds_zals.png",
                                              colorsList: flowersColors,
                                            )
                                          : SizedBox(
                                              width: 0,
                                            ),
                                      // InfoBoxWithColors(
                                      //   title: "Augļu krāsa",
                                      //   imagePath: "Piktogramma_abols_zals.png",
                                      //   colorsList: [
                                      //     Colors.black,
                                      //   ],
                                      // ),
                                      leafsColors.length > 0
                                          ? InfoBoxWithColors(
                                              title: "Lapu krāsa",
                                              imagePath:
                                                  "Piktogramma_lapa_zals.png",
                                              colorsList: leafsColors,
                                            )
                                          : SizedBox(
                                              width: 0,
                                            ),
                                    ],
                                  ),
                                ),
                                snapshot.data[0][0].link_tez != null
                                    ? InternetSource(
                                        sourceTitle: "TEZAURS",
                                        sourceUrl: snapshot.data[0][0].link_tez,
                                      )
                                    : SizedBox(height: 0),
                                snapshot.data[4] == ""
                                    ? SizedBox(height: 0)
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xFFf0ec74),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                            ),
                                            child: Text(
                                              snapshot.data[4],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 19),
                                            ),
                                          ),
                                        ),
                                      ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFf0ec74),
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Type(
                                      title: foundType[0][0],
                                      color: foundType[0][1],
                                    ),
                                  ),
                                ),

                                // Align(
                                //   alignment: Alignment.topLeft,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 5),
                                //     child: Text(
                                //       snapshot.data[4],
                                //       textAlign: TextAlign.left,
                                //       style: TextStyle(fontSize: 20),
                                //     ),
                                //   ),
                                // ),
                                // foundType.length > 0
                                //     ? Align(
                                //         alignment: Alignment.topLeft,
                                //         child: Type(
                                //           title: foundType[0][0],
                                //           color: foundType[0][1],
                                //         ),
                                //       )
                                //     : SizedBox(
                                //         height: 0,
                                //       )
                              ],
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),

              // Text(
              //   "f - feminium; m - maskulinium; n - neutrum; pl - pluralis; sg - singularis",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 16),
              // ),
              // TypesList(
              //   typesList: [
              //     ["ģints", Colors.green],
              //     ["apakšģints", Colors.yellow],
              //     ["suga", Colors.blue],
              //     ["pasuga", Colors.purple],
              //     ["varietāte", Colors.brown],
              //     ["forma", Colors.red],
              //     ["šķirņu grupa", Colors.pink],
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleInfoBox extends StatelessWidget {
  const SimpleInfoBox({
    Key key,
    this.title,
    this.imagesList,
  }) : super(key: key);

  final String title;
  final List imagesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          // gradient: kDefaultLinearGradient,
          color: Color(0xFFf0ec74),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Row(
          children: [
            imagesList != null
                ? Row(
                    children: imagesList
                        .map((e) => Tooltip(
                              message: e[0],
                              child: PiktoIcon(
                                imagePath: e[1],
                              ),
                            ))
                        .toList())
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class InfoBoxWithColors extends StatelessWidget {
  const InfoBoxWithColors({
    Key key,
    this.title,
    this.imagePath,
    this.colorsList,
  }) : super(key: key);
  final String imagePath, title;
  final List colorsList;

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
      child: Container(
        width: 71 + 26.0 * colorsList.length,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFf0ec74),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Row(
          children: [
            imagePath != null
                ? Tooltip(
                    message: title,
                    child: PiktoIcon(
                      imagePath: imagePath,
                    ),
                  )
                : SizedBox(),
            colorsList != null
                ? Row(
                    children: colorsList.map((e) {
                      return ColouredCircle(
                        color: hexToColor("#" + e),
                      );
                    }).toList(),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ColouredCircle extends StatelessWidget {
  const ColouredCircle({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1, color: Colors.black),
          color: this.color,
        ),
      ),
    );
  }
}

class PiktoIcon extends StatelessWidget {
  const PiktoIcon({Key key, this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Image.asset(
          "assets/icons/piktogrammas/${imagePath}",
          width: 35,
          height: 35,
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

class InternetSource extends StatefulWidget {
  const InternetSource({
    Key key,
    this.sourceTitle,
    this.sourceUrl,
  }) : super(key: key);

  final String sourceTitle, sourceUrl;

  @override
  _InternetSourceState createState() => _InternetSourceState();
}

class _InternetSourceState extends State<InternetSource> {
  Future<void> _launched;
  String _phone = '';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            "${widget.sourceTitle}: ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser("${widget.sourceUrl}");
                });
              },
              child: Text(
                "${widget.sourceUrl}",
                style: TextStyle(color: kDefaultColor, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TranslationListItem extends StatelessWidget {
  const TranslationListItem(
      {Key key,
      this.language,
      this.imagePath,
      this.translationsList,
      this.haveData})
      : super(key: key);
  final String language, imagePath;
  final List<Translation> translationsList;
  final bool haveData;
  @override
  Widget build(BuildContext context) {
    if (translationsList != null && translationsList.length > 1) {
      if (language == "Latvian") {
        if (translationsList[0].lv_prio != null) {
          translationsList.sort((a, b) => a.lv_prio.compareTo(b.lv_prio));
        }
      }
      if (language == "German") {
        if (translationsList[0].de_prio != null) {
          translationsList.sort((a, b) => a.de_prio.compareTo(b.de_prio));
        }
      }
      if (language == "Russian") {
        if (translationsList[0].ru_prio != null) {
          translationsList.sort((a, b) => a.ru_prio.compareTo(b.ru_prio));
        }
      }
    }

    return haveData == false
        ? SizedBox(
            height: 0,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              decoration: BoxDecoration(
                  gradient: kDefaultLinearGradient,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: imagePath != null
                        ? Tooltip(
                            message: language,
                            child: Image.asset(
                              imagePath,
                              width: 40,
                            ),
                          )
                        : Text(
                            " ${language} ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(width: 10),
                  language == "Latvian"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: translationsList
                              .map((e) => Container(
                                    width:
                                        MediaQuery.of(context).size.width - 130,
                                    child: Text(
                                      e.lv + " " + e.lv_apz,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: e.piezimes == "ģints"
                                            ? Colors.green
                                            : e.piezimes == "apakšģints"
                                                ? Colors.yellow
                                                : e.piezimes == "suga"
                                                    ? Colors.blue
                                                    : e.piezimes == "pasuga"
                                                        ? Colors.purple
                                                        : e.piezimes ==
                                                                "varietāte"
                                                            ? Colors.brown
                                                            : e.piezimes ==
                                                                    "forma"
                                                                ? Colors.red
                                                                : e.piezimes ==
                                                                        "šķirnu grupa"
                                                                    ? Colors
                                                                        .pink
                                                                    : Colors
                                                                        .white,
                                      ),
                                    ),
                                  ))
                              .toList())
                      : Column(
                          children: translationsList
                              .map(
                                (e) => Container(
                                  width:
                                      MediaQuery.of(context).size.width - 130,
                                  child: Text(
                                    language == "Latin"
                                        ? e.la
                                        : language == "German"
                                            ? e.de + " " + e.de_apz
                                            : language == "Russian"
                                                ? e.ru + " " + e.ru_apz
                                                : language == "English"
                                                    ? e.en
                                                    : "",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList())
                  // Flexible(
                  //   child: language == "Latvian" && type != null
                  //       ? Text(
                  //           "${translation}",
                  //           style: TextStyle(
                  //             fontSize: 24,
                  //             fontStyle: FontStyle.italic,
                  //             color: type == "ģints"
                  //                 ? Colors.green
                  //                 : type == "apakšģints"
                  //                     ? Colors.yellow
                  //                     : type == "suga"
                  //                         ? Colors.blue
                  //                         : type == "pasuga"
                  //                             ? Colors.purple
                  //                             : type == "varietāte"
                  //                                 ? Colors.brown
                  //                                 : type == "forma"
                  //                                     ? Colors.red
                  //                                     : type == "šķirnu grupa"
                  //                                         ? Colors.pink
                  //                                         : Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         )
                  //       : Text(
                  //           "${translation}",
                  //           style: TextStyle(
                  //             fontSize: 24,
                  //             fontStyle: FontStyle.italic,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  // ),
                ],
              ),
            ),
          );
  }
}
