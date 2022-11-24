import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/sqlite/translation.dart';
import 'package:flutterTestApp/views/SingleTranslationScreen.dart';

class ResultsByFilterScreen extends StatefulWidget {
  ResultsByFilterScreen({
    this.plantTypeId,
    this.flowersColorsIdsList,
    this.fruitsColorsIdsList,
    this.needlesColorsIdsList,
    this.foliageColorsIdsList,
    this.floweringMonthsList,
  });

  final int plantTypeId;
  final List flowersColorsIdsList,
      fruitsColorsIdsList,
      needlesColorsIdsList,
      floweringMonthsList,
      foliageColorsIdsList;

  @override
  _ResultsByFilterScreenState createState() => _ResultsByFilterScreenState();
}

class _ResultsByFilterScreenState extends State<ResultsByFilterScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Translation> foundTranslations = [];
  var textsList = [];
  var monthsText = "";
  var typeText = "";
  var loading = false;
  @override
  void initState() {
    textsList.add("Auga tips");
    getData();
    loadDataFromDb();
    // TODO: implement initState
    super.initState();
  }

  getData() {
//START GET texts
    if (widget.fruitsColorsIdsList.length > 0) {
      textsList.add("Augļu krāsa ");
    }
    if (widget.floweringMonthsList.length > 0) {
      textsList.add("Ziedēšānas laiks");
    }
    if (widget.foliageColorsIdsList.length > 0) {
      textsList.add("Lapu krāsa ");
    }
    if (widget.flowersColorsIdsList.length > 0) {
      textsList.add("Ziedu krāsa ");
    }
    if (widget.needlesColorsIdsList.length > 0) {
      textsList.add("Skuju krāsa ");
    }
//END GET texts
//START GET months text
    var mText = "";
    widget.floweringMonthsList.forEach((monthId) {
      var index = widget.floweringMonthsList.indexOf(monthId);
      var foundMonth = monthsList.firstWhere((month) => month["id"] == monthId,
          orElse: () => null);
      if (foundMonth != null) {
        mText += "${index > 0 ? ',' : ''}${foundMonth['number']}";
      }
    });
    setState(() {
      monthsText = mText;
    });
    //END GET months text
    //START GET plant type text
    var foundType = plantsGroups.firstWhere(
        (group) => group.id == widget.plantTypeId,
        orElse: () => null);
    if (foundType != null) {
      setState(() {
        typeText = foundType.text;
      });
    }
    //END GET plant type  text
  }

  loadDataFromDb() {
    loading = true;
    var object = {
      "plantTypeId": widget.plantTypeId,
      "flowerIdsList": widget.flowersColorsIdsList,
      "fruitIdsList": widget.fruitsColorsIdsList,
      "foliageIdsList": widget.foliageColorsIdsList,
      "needlesIdsList": widget.needlesColorsIdsList,
      "monthsIdsList": widget.floweringMonthsList
    };
    dbHelper.getTranslationsBySearchFilters(object).then((translations) {
      setState(() {
        foundTranslations = translations;
        loading = false;
      });
    });
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
      title: getTranslation(context, "results_after_filter"),
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
                        children: [
                          ListWithText(
                            lettersCount: lettersCount,
                            title: getTranslation(context, "plant_type"),
                            text: getTranslation(context, typeText),
                          ),
                          ListWithText(
                              lettersCount: lettersCount,
                              title: getTranslation(context, "flower_color"),
                              colorsIdsList: widget.flowersColorsIdsList),
                          ListWithText(
                            lettersCount: lettersCount,
                            title: getTranslation(context, "flowering_time"),
                            text: monthsText,
                          ),
                          ListWithText(
                              lettersCount: lettersCount,
                              title: getTranslation(context, "fruit_color"),
                              colorsIdsList: widget.fruitsColorsIdsList),
                          ListWithText(
                              lettersCount: lettersCount,
                              title: getTranslation(context, "foliage_color"),
                              colorsIdsList: widget.foliageColorsIdsList),
                          ListWithText(
                              lettersCount: lettersCount,
                              title: getTranslation(context, "needles_color"),
                              colorsIdsList: widget.needlesColorsIdsList),
                        ],
                      )),
                ),
              ),
              loading
                  ? CircularProgressIndicator()
                  : foundTranslations.length == 0
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                getTranslation(
                                    context, "no_results_found_by_filters"),
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
                                    getTranslation(context, "return"),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFC2BE66),
                                    ),
                                  ),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                          children: foundTranslations.map((translation) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SingleTranslationScreen(translation.id),
                                  ),
                                );
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: MediaQuery.of(context).size.width - 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kDefaultColor, width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${translation.la}",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: kDefaultColor,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.launch_outlined,
                                        color: kDefaultColor,
                                      ),
                                    ],
                                  )),
                            );
                          }).toList(),
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
      {Key key,
      @required this.lettersCount,
      this.text,
      this.title,
      this.colorsIdsList})
      : super(key: key);

  final int lettersCount;
  final String text;
  final String title;
  final List colorsIdsList;

  @override
  Widget build(BuildContext context) {
    var haveText = text != null && text.length > 0;
    var haveColors = colorsIdsList != null && colorsIdsList.length > 0;
    return haveColors || haveText
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
                            width: lettersCount * 12.0,
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
                        haveText
                            ? Text(
                                text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : SizedBox(),
                        haveColors
                            ? Row(
                                children: colorsIdsList.map((colorId) {
                                  var foundColor = plantColors.firstWhere(
                                      (color) => color["id"] == colorId,
                                      orElse: () => null);
                                  if (foundColor != null) {
                                    return ColorCircle(
                                      colorCode: foundColor["hexCode"],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                }).toList(),
                              )
                            : SizedBox(),
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
