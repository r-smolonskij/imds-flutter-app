import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/SingleTranslation/ColouredCircle.dart';
import 'package:flutterTestApp/components/SingleTranslation/PiktoIcon.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/db/colors_inserts.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';

class PlantBodyPartColorsList extends StatefulWidget {
  const PlantBodyPartColorsList({Key key, this.type, this.translationID})
      : super(key: key);
  final String type;
  final int translationID;

  @override
  _PlantBodyPartColorsListState createState() =>
      _PlantBodyPartColorsListState();
}

class _PlantBodyPartColorsListState extends State<PlantBodyPartColorsList> {
  DatabaseHelper dbHelper = DatabaseHelper();

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  var colorsList = [];
  bool loading = false;
  var imagesList = {
    "flower": "Piktogramma_zieds_zals.png",
    "foliage": "Piktogramma_lapa_zals.png",
    "fruit": "Piktogramma_abols_zals.png",
  };
  var tooltipsList = {
    "flower": "Ziedu krāsa",
    "foliage": "Lapu krāsa",
    "fruit": "Augļa krāsa",
  };

  initState() {
    getData();
  }

  getData() {
    loading = true;
    dbHelper
        .getPlantBodyPartColor(widget.translationID, widget.type)
        .then((colorsIds) {
      colorsIds.forEach((colorId) {
        var foundColor = plantColors
            .firstWhere((color) => color["id"] == colorId, orElse: () => null);
        if (foundColor != null) {
          colorsList.add(foundColor);
        }
      });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageName = imagesList[widget.type];
    var toolTip = tooltipsList[widget.type];
    return loading
        ? CircularProgressIndicator()
        : (!loading && colorsList.length > 0)
            ? Padding(
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
                      toolTip != null
                          ? Tooltip(
                              message: toolTip,
                              child: PiktoIcon(
                                imagePath: imageName,
                              ),
                            )
                          : SizedBox(),
                      colorsList != null
                          ? Row(
                              children: colorsList.map((color) {
                                return ColouredCircle(
                                  color: hexToColor("#" + color["hexCode"]),
                                );
                              }).toList(),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              )
            : SizedBox();
  }
}
