import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/models/PlantTypeModel.dart';
import 'package:path_provider/path_provider.dart';

class TranslationWithPlantTypesInserts {
  Store _store;
  var transPlantBox, plantTypeBox, transBox;

  void clearAllPlantTypes() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      plantTypeBox = _store.box<PlantType>();
      plantTypeBox.removeAll();
    });
  }

  void clearAllTranslationsWithPlantTypes() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transPlantBox = _store.box<TranslationWithPlantType>();
      transPlantBox.removeAll();
    });
  }

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      plantTypeBox = _store.box<PlantType>();
      transBox = _store.box<Translation>();
      transPlantBox = _store.box<TranslationWithPlantType>();
      planTypesList.map((e) {
        var foundPlantTypeQuery =
            plantTypeBox.query(PlantType_.title.equals(e[1])).build();
        if (foundPlantTypeQuery.count() == 0) {
          plantTypeBox.put(PlantType(id: e[0], title: e[1]));
        }
      }).toList();
      transPlantList.map((e) {
        var translation = transBox.get(e[0]);
        translation.plantTypeID = e[1];
        transBox.put(translation);
        var foundTranslationInList = transPlantBox
            .query(TranslationWithPlantType_.translationID.equals(e[0]))
            .build();
        if (foundTranslationInList.count() == 0) {
          transPlantBox.put(
              TranslationWithPlantType(translationID: e[0], plantTypeID: e[1]));
        }
      }).toList();
    });
  }

  var transPlantList = [
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2],
    [5, 2],
    [6, 1],
    [7, 1],
    [8, 1],
    [9, 1],
    [10, 1],
    [11, 2],
    [12, 2],
    [13, 3],
    [14, 3],
    [15, 3],
    [16, 3],
    [17, 3],
    [18, 3],
    [19, 4],
    [20, 4],
    [21, 4],
    [22, 5],
    [23, 5],
    [24, 5],
    [25, 6],
    [26, 6],
    [27, 6],
    [28, 7],
    [29, 7],
    [30, 7],
    [31, 7],
    [32, 7],
    [33, 7],
    [34, 8],
    [35, 8],
    [36, 8],
    [37, 8],
    [38, 8],
  ];
  var planTypesList = [
    [1, "Viengadīgs lakstaugs"],
    [2, "Daudzgadīgs lakstaugs"],
    [3, "Lapu krūms"],
    [4, "Skuju krūms"],
    [5, "Liāna"],
    [6, "Lapu koks"],
    [7, "Skuju koks"],
    [8, "Telpaugs"],
  ];
}
