import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/views/ResultsByFilterScreen.dart';
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
  DatabaseHelper dbHelper = DatabaseHelper();
  var selectedTypeId;
  List<int> selectedMonthsIds = [];
  List<int> selectedFlowerColorsIds = [];
  List<int> selectedFoliageColorsIds = [];
  List<int> selectedNeedlesColorsIds = [];
  List<int> selectedFruitColorsIds = [];
  List<int> plantsWithFoliage = [0, 1, 2, 4, 6, 7];
  List<int> plantsWithNeedles = [3, 5, 6, 7];
  var monthsText;
  var loading = false;
  changeSelectedType(type) {
    loading = true;
    setState(() {
      selectedTypeId = type;
      loading = false;
      selectedNeedlesColorsIds = [];
      selectedFoliageColorsIds = [];
    });
  }

  var allFlowerColorsList = [];
  var allFoliageColorsList = [];
  var allNeedlesColorsList = [];
  var allFruitColorsList = [];
  var plantParts = [
    "flower",
    "foliage",
    "fruit",
    "needles",
  ];

  getData() async {
    loading = true;
    for (var part in plantParts) {
      dbHelper.getUsedColorsByPlantPart(part).then((colorsIds) {
        var colorsList = [];
        colorsIds.forEach((colorId) {
          var foundColor = plantColors.firstWhere(
              (color) => color["id"] == colorId,
              orElse: () => null);
          if (foundColor != null) {
            colorsList.add(foundColor);
          }
        });
        setState(() {
          if (part == "flower") {
            allFlowerColorsList = colorsList;
          } else if (part == "foliage") {
            allFoliageColorsList = colorsList;
          } else if (part == "fruit") {
            allFruitColorsList = colorsList;
          } else if (part == "needles") {
            allNeedlesColorsList = colorsList;
          }
        });
      });
      await Future.delayed(const Duration(milliseconds: 50));
    }
    setState(() {
      loading = false;
    });
  }

  onColorClick(type, colorId) {
    loading = true;
    var parts = {
      "flower": selectedFlowerColorsIds,
      "foliage": selectedFoliageColorsIds,
      "fruit": selectedFruitColorsIds,
      "needles": selectedNeedlesColorsIds,
    };
    var colorsIdsList = [...parts[type]];
    var index = colorsIdsList.indexOf(colorId);
    if (index > -1) {
      colorsIdsList.removeAt(index);
    } else {
      colorsIdsList.add(colorId);
    }
    setState(() {
      if (type == "flower") {
        selectedFlowerColorsIds = colorsIdsList;
      } else if (type == "foliage") {
        selectedFoliageColorsIds = colorsIdsList;
      } else if (type == "fruit") {
        selectedFruitColorsIds = colorsIdsList;
      } else if (type == "needles") {
        selectedNeedlesColorsIds = colorsIdsList;
      }
      loading = false;
    });
  }

  onMonthClick(monthId) {
    loading = true;
    var index = selectedMonthsIds.indexOf(monthId);
    if (index > -1) {
      selectedMonthsIds.removeAt(index);
    } else {
      selectedMonthsIds.add(monthId);
    }
    var text = "";
    selectedMonthsIds.forEach((monthId) {
      var index = selectedMonthsIds.indexOf(monthId);
      text += index > 0
          ? ", ${monthsList[monthId - 1]['number']}"
          : monthsList[monthId - 1]['number'];
    });
    setState(() {
      monthsText = text;
    });

    loading = false;
  }

  isColorSelected(type, colorId) {
    var parts = {
      "flower": selectedFlowerColorsIds,
      "foliage": selectedFoliageColorsIds,
      "fruit": selectedFruitColorsIds,
      "needles": selectedNeedlesColorsIds,
    };
    return parts[type].indexOf(colorId) > -1;
  }

  onSearch() {
    if (selectedTypeId != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultsByFilterScreen(
            plantTypeId: selectedTypeId,
            flowersColorsIdsList: selectedFlowerColorsIds,
            needlesColorsIdsList: selectedNeedlesColorsIds,
            fruitsColorsIdsList: selectedFruitColorsIds,
            foliageColorsIdsList: selectedFoliageColorsIds,
            floweringMonthsList: selectedMonthsIds,
          ),
        ),
      );
    } else {
      showAlertDialog(context,
          'Lai varētu veikt meklēšanu pēc pazīmēm, lūdzu aizpildiet "Auga tips" lauku! ');
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
        title: getTranslation(context, "search_by_filters"),
        child: loading
            ? CircularProgressIndicator()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    SearchFieldButton(
                        title: getTranslation(context, "plant_type"),
                        dialogFunction: () => showMaterialDialog(),
                        selectedTypeId: selectedTypeId),
                    SearchFieldButton(
                      title: getTranslation(context, "flowering_time"),
                      monthsText: monthsText,
                      dialogFunction: () => showMonthsDialog(),
                    ),
                    //Mēnesis
                    SearchFieldButton(
                      title: getTranslation(context, "flower_color"),
                      dialogFunction: () => showColorsDialogBox("flower"),
                      colorsIdsList: selectedFlowerColorsIds,
                    ),
                    SearchFieldButton(
                      title: getTranslation(context, "fruit_color"),
                      dialogFunction: () => showColorsDialogBox("fruit"),
                      colorsIdsList: selectedFruitColorsIds,
                    ),
                    plantsWithFoliage.contains(selectedTypeId)
                        ? SearchFieldButton(
                            title: getTranslation(context, "foliage_color"),
                            dialogFunction: () =>
                                showColorsDialogBox("foliage"),
                            colorsIdsList: selectedFoliageColorsIds,
                          )
                        : SizedBox(),
                    plantsWithNeedles.contains(selectedTypeId)
                        ? SearchFieldButton(
                            title: getTranslation(context, "needles_color"),
                            dialogFunction: () =>
                                showColorsDialogBox("needles"),
                            colorsIdsList: selectedNeedlesColorsIds,
                          )
                        : SizedBox(),
                    GestureDetector(
                      onTap: () => onSearch(),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFf0ec74),
                        ),
                        child: Align(
                          child: Text(
                            getTranslation(context, "search"),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }

  showColorsDialogBox(String type) {
    var titlesList = {
      "flower": getTranslation(context, "flower_color"),
      "fruit": getTranslation(context, "fruit_color"),
      "foliage": getTranslation(context, "foliage_color"),
      "needles": getTranslation(context, "needles_color"),
    };
    var colorsList = {
      "flower": allFlowerColorsList,
      "fruit": allFruitColorsList,
      "foliage": allFoliageColorsList,
      "needles": allNeedlesColorsList,
    };
    var title = titlesList[type];
    var colors = colorsList[type];
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
              children: colors.map((color) {
                // return SizedBox();
                return ColorSelectionItem(
                  color: color["hexCode"],
                  colorTitle:
                      getTranslation(context, color["color_translation"]),
                  isSelected: isColorSelected(type, color["id"]),
                  onSelection: () => onColorClick(type, color["id"]),
                );
              }).toList(),
            ),
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
              getTranslation(context, "plant_type"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
                children: plantsGroups.map(
              (group) {
                return SelectionItem(
                  id: group.id,
                  title: getTranslation(context, group.text),
                  imagePath: group.imageName,
                  onPress: () => changeSelectedType(group.id),
                  isSelected: group.id == selectedTypeId,
                );
              },
            ).toList()),
          ]),
        ),
      ),
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
              getTranslation(context, "flowering_time"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: monthsList
                  .map(
                    (month) => MonthSelectionItem(
                      monthRoman: month["number"],
                      monthTitle:
                          getTranslation(context, month['month_translation']),
                      isSelected: selectedMonthsIds.indexOf(month["id"]) > -1,
                      onTap: () => onMonthClick(month["id"]),
                    ),
                  )
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }
}
