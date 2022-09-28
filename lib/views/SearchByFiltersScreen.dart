import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/views/ResultsByFilterScreen.dart';
import 'dart:io';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutterTestApp/components/SearchByFilters/ColorSelectionItem.dart';
import 'package:flutterTestApp/components/SearchByFilters/MonthSelectionItem.dart';
import 'package:flutterTestApp/components/SearchByFilters/SelectionItem.dart';
import 'package:flutterTestApp/components/SearchByFilters/SearchFieldButton.dart';

class SearchByFiltersScreen extends StatefulWidget {
  // SearchByFiltersScreen({Key key}) : super(key: key);
  @override
  _SearchByFiltersScreenState createState() => _SearchByFiltersScreenState();
}

class _SearchByFiltersScreenState extends State<SearchByFiltersScreen> {
  var selectedTypeID, _store, colorsBox;
  var typesList = [],
      needlesColorsList = [],
      leafsColorsList = [],
      flowersColorsList = [],
      fruitsColorsList = [];

  var monthsList = [
    [0, "I", "Janvāris", false],
    [1, "II", "Februāris", false],
    [2, "III", "Marts", false],
    [3, "IV", "Aprīlis", false],
    [4, "V", "Maijs", false],
    [5, "VI", "Jūnijs", false],
    [6, "VII", "Jūlijs", false],
    [7, "VIII", "Augusts", false],
    [8, "IX", "Septembris", false],
    [9, "X", "Oktobris", false],
    [10, "XI", "Novembris", false],
    [11, "XII", "Decembris", false],
  ];
  var monthsText = "";
  void changeListColorSelectionState(List list, int id) {
    setState(() {
      list[id][3] = !list[id][3];
    });
  }

  void changeMonthSelectionState(int id) {
    setState(() {
      monthsList[id][3] = !monthsList[id][3];
      monthsText = "";
      monthsList.map((e) {
        if (e[3]) {
          print(e[3]);
          monthsText = monthsText == ""
              ? e[1].toString()
              : monthsText + ", " + e[1].toString();
        }
      }).toList();
    });
  }

  void changeSelectionItemState(int id) {
    setState(() {
      selectedTypeID = id;
      needlesColorsList.map((e) => e[3] = false).toList();
      leafsColorsList.map((e) => e[3] = false).toList();
      flowersColorsList.map((e) => e[3] = false).toList();
      fruitsColorsList.map((e) => e[3] = false).toList();
      monthsList.map((e) => e[3] = false).toList();
      monthsText = "";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  getSpecColorsList(List listToChange, String boxName) {
    var transColorsBox;
    switch (boxName) {
      case "needlesColors":
        transColorsBox = _store.box<NeedlesColors>();
        break;
      case "flowersColors":
        transColorsBox = _store.box<FlowersColors>();
        break;
      case "leafsColors":
        transColorsBox = _store.box<LeafsColors>();
        break;
      case "fruitsColors":
        transColorsBox = _store.box<FruitsColors>();
        break;
    }
    var query1 = transColorsBox.query().build();
    List results = query1.find();

    results.map((e) {
      var colorModel = colorsBox.get(e.id);
      if (colorModel != null) {
        bool isInArray = false;
        listToChange.map((element) {
          if (element[0] == e.id) {
            isInArray = true;
          }
        }).toList();
        if (!isInArray) {
          listToChange
              .add([e.id, colorModel.title, colorModel.colorCode, false]);
        }
      }
    }).toList();
  }

  Future<dynamic> fetchData() async {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      var plantTypeBox = _store.box<PlantType>();
      colorsBox = _store.box<CustomColor>();
      getSpecColorsList(flowersColorsList, "flowersColors");
      getSpecColorsList(needlesColorsList, "needlesColors");
      getSpecColorsList(leafsColorsList, "leafsColors");
      getSpecColorsList(fruitsColorsList, "fruitsColors");
      var allPlantTypes = plantTypeBox.getAll();
      allPlantTypes.map((e) {
        bool isInArray = false;
        typesList.map((element) {
          if (element[0] == e.id) {
            isInArray = true;
          }
        }).toList();
        if (!isInArray) {
          if (e.title.trim().contains(' ')) {
            var indexOfWhitespace = e.title.indexOf(' ');
            var imagePath = e.title.substring(0, indexOfWhitespace) +
                "_" +
                e.title.substring(indexOfWhitespace + 1) +
                ".png";
            typesList.add([e.id, e.title, imagePath]);
          } else {
            typesList.add([e.id, e.title, e.title + ".png"]);
          }
        }
      }).toList();
    });
    return [flowersColorsList];
  }

  getSelectedColorsFromList(list) {
    return list.where((e) => e[3] == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: "Meklēšana pēc augu pazīmēm",
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SearchFieldButton(
                          title: "Auga tips",
                          dialogFunction: () => showMaterialDialog(),
                          selectedType: selectedTypeID != null
                              ? typesList[selectedTypeID]
                              : null),
                      SearchFieldButton(
                        title: "Ziedu krāsa",
                        dialogFunction: () => showColorsDialogBox(
                            flowersColorsList, "Ziedu krāsa"),
                        colorsList:
                            getSelectedColorsFromList(flowersColorsList),
                      ),
                      SearchFieldButton(
                        title: "Ziedēšanas laiks",
                        monthsText: monthsText,
                        dialogFunction: () => showMonthsDialog(),
                      ),
                      SearchFieldButton(
                        title: "Augļu krāsa",
                        dialogFunction: () => showColorsDialogBox(
                            fruitsColorsList, "Augļu krāsa"),
                        colorsList: getSelectedColorsFromList(fruitsColorsList),
                      ),
                      selectedTypeID == 2 || selectedTypeID == 5
                          ? SearchFieldButton(
                              title: "Lapu krāsa",
                              dialogFunction: () => showColorsDialogBox(
                                  leafsColorsList, "Lapu krāsa"),
                              colorsList:
                                  getSelectedColorsFromList(leafsColorsList),
                            )
                          : SizedBox(),
                      selectedTypeID == 3 || selectedTypeID == 6
                          ? SearchFieldButton(
                              title: "Skuju krāsa",
                              dialogFunction: () => showColorsDialogBox(
                                  needlesColorsList, "Skuju krāsa"),
                              colorsList:
                                  getSelectedColorsFromList(needlesColorsList))
                          : SizedBox(),
                      GestureDetector(
                        onTap: () {
                          if (selectedTypeID != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ResultsByFilterScreen(
                                  plantType: selectedTypeID != null
                                      ? [
                                          typesList[selectedTypeID][1],
                                          typesList[selectedTypeID][0]
                                        ]
                                      : [],
                                  flowersColorsList: getSelectedColorsFromList(
                                      flowersColorsList),
                                  needlesColorsList: getSelectedColorsFromList(
                                      needlesColorsList),
                                  leafsColorsList: getSelectedColorsFromList(
                                      leafsColorsList),
                                  fruitsColorsList: getSelectedColorsFromList(
                                      fruitsColorsList),
                                  floweringMonthsList: monthsList
                                      .where((e) => e[3] == true)
                                      .toList(),
                                ),
                              ),
                            );
                          } else {
                            showDialog(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        'Lai varētu veikt meklēšanu pēc pazīmēm, lūdzu aizpildiet "Auga tips" lauku! ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.red),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            "Atgriezties",
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
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFf0ec74),
                          ),
                          child: Align(
                            child: Text(
                              "Meklēt",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }

  showMonthsDialog() {
    showDialog(
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
            Text(
              "Ziedēšanas laiks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: monthsList
                  .map(
                    (month) => MonthSelectionItem(
                      monthRoman: month[1],
                      monthTitle: month[2],
                      isSelected: month[3],
                      onSelected: () => changeMonthSelectionState(month[0]),
                    ),
                  )
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }

  showMaterialDialog() {
    showDialog(
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
            Text(
              "Auga tips",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
                children: typesList.map(
              (e) {
                var index = typesList.indexOf(e);

                return SelectionItem(
                  id: index,
                  title: typesList[index][1],
                  isSelected: selectedTypeID,
                  imagePath: typesList[index][2],
                  stateSetter: () {
                    changeSelectionItemState(index);
                  },
                );
              },
            ).toList()),
          ]),
        ),
      ),
    );
  }

  showColorsDialogBox(List listToChange, String title) {
    showDialog(
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
            Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: listToChange.map((e) {
                var index = listToChange.indexOf(e);

                // return SizedBox();
                return ColorSelectionItem(
                  color: e[2],
                  colorTitle: e[1],
                  isSelected: e[3],
                  onSelection: () =>
                      changeListColorSelectionState(listToChange, index),
                );
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
