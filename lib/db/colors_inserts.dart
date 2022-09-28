import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

class ColorsInserts {
  Store _store;
  var colorsBox;
  void cleanAllInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      colorsBox = _store.box<CustomColor>();
      colorsBox.removeAll();
    });
  }

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      colorsBox = _store.box<CustomColor>();
      var query = colorsBox.query().build();
      print("colorsCount == " + query.count().toString());

      if (query.count() == 0) {
        // colorsBox.removeAll();
        for (var i = 0; i < colorsList.length; i++) {
          colorsBox.put(CustomColor(
              id: colorsList[i][0],
              title: colorsList[i][1],
              colorCode: colorsList[i][2]));
        }
      }
      print("colorsCount == " + query.count().toString());
    });
  }
}

var colorsList = [
  [1, "Balti", "FFFFFF"],
  [2, "Dzelteni", "FFFF00"],
  [3, "Oranži", "FFA500"],
  [4, "Gaiši sarkani", "FF6347"],
  [5, "Sarkani", "FF0000"],
  [6, "Tumši sarkani", "8B0000"],
  [7, "Laima", "00FF00"],
  [8, "Gaiši zaļi", "90EE90"],
  [9, "Zaļš", "008000"],
  [10, "Tumši zaļi", "006400"],
  [11, "Gaiši zili", "ADD8E6"],
  [12, "Zili", "0000FF"],
  [13, "Tumši zili", "00008B"],
  [14, "Brūni", "A52A2A"],
  [15, "Violeti", "C71585"],
  [16, "Rozā", "FFC0CB"],
  [17, "Melni", "000000"],
];
