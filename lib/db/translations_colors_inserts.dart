import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

class TranslationsColorsInserts {
  Store _store;
  var transColorBox, specColorBox;

  void clearTranslationsWithColorsGroup(String groupName) {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');

      switch (groupName) {
        case "needlesColors":
          transColorBox = _store.box<TranslationWithNeedlesColor>();
          specColorBox = _store.box<NeedlesColors>();
          break;
        case "flowersColors":
          transColorBox = _store.box<TranslationWithFlowersColor>();
          specColorBox = _store.box<FlowersColors>();
          break;
        case "leafsColors":
          transColorBox = _store.box<TranslationWithLeafsColor>();
          specColorBox = _store.box<LeafsColors>();
          break;
        case "fruitsColors":
          transColorBox = _store.box<TranslationWithFruitsColor>();
          specColorBox = _store.box<FruitsColors>();
          break;
      }
      transColorBox.removeAll();
      specColorBox.removeAll();
    });
  }

  void addInserts(String groupName) {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      var iterableList = [];
      switch (groupName) {
        case "needlesColors":
          transColorBox = _store.box<TranslationWithNeedlesColor>();
          specColorBox = _store.box<NeedlesColors>();
          iterableList = transNeedlesColorsList;
          break;
        case "flowersColors":
          transColorBox = _store.box<TranslationWithFlowersColor>();
          specColorBox = _store.box<FlowersColors>();
          iterableList = transFlowerColorsList;
          break;
        case "leafsColors":
          transColorBox = _store.box<TranslationWithLeafsColor>();
          specColorBox = _store.box<LeafsColors>();
          iterableList = transLeafsColorsList;
          break;
        case "fruitsColors":
          transColorBox = _store.box<TranslationWithFruitsColor>();
          specColorBox = _store.box<FruitsColors>();
          iterableList = transFruitsColorsList;
          break;
      }

      iterableList.map((e) {
        // var foundListQuery;

        var foundLeafsColorsQuery = transColorBox
            .query(
              groupName == "leafsColors"
                  ? TranslationWithLeafsColor_.translationID
                      .equals(e[0])
                      .and(TranslationWithLeafsColor_.colorID.equals(e[1]))
                  : groupName == "flowersColors"
                      ? TranslationWithFlowersColor_.translationID
                          .equals(e[0])
                          .and(TranslationWithFruitsColor_.colorID.equals(e[1]))
                      : groupName == "needlesColors"
                          ? TranslationWithNeedlesColor_.translationID
                              .equals(e[0])
                              .and(TranslationWithNeedlesColor_.colorID
                                  .equals(e[1]))
                          : TranslationWithFruitsColor_.translationID
                              .equals(e[0])
                              .and(
                                TranslationWithFruitsColor_.colorID
                                    .equals(e[1]),
                              ),
            )
            .build();
        if (foundLeafsColorsQuery.count() == 0) {
          if (groupName == "leafsColors") {
            transColorBox.put(
                TranslationWithLeafsColor(translationID: e[0], colorID: e[1]));
          }
          if (groupName == "needlesColors") {
            transColorBox.put(TranslationWithNeedlesColor(
                translationID: e[0], colorID: e[1]));
          }
          if (groupName == "flowersColors") {
            transColorBox.put(TranslationWithFlowersColor(
                translationID: e[0], colorID: e[1]));
          }
          if (groupName == "fruitsColors") {
            transColorBox.put(
                TranslationWithFruitsColor(translationID: e[0], colorID: e[1]));
          }
        }
        if (groupName == "leafsColors") {
          specColorBox.put(LeafsColors(id: e[1], colorID: e[1]));
        }
        if (groupName == "needlesColors") {
          specColorBox.put(NeedlesColors(id: e[1], colorID: e[1]));
        }
        if (groupName == "flowersColors") {
          specColorBox.put(FlowersColors(id: e[1], colorID: e[1]));
        }
        if (groupName == "fruitsColors") {
          specColorBox.put(FruitsColors(id: e[1], colorID: e[1]));
        }
      }).toList();
    });
  }
  void addAllInserts(){
    addInserts("needlesColors");
    addInserts("leafsColors");
    addInserts("fruitsColors");
    addInserts("flowersColors");
  }
  void clearAllInserts(){
    clearTranslationsWithColorsGroup("needlesColors");
    clearTranslationsWithColorsGroup("leafsColors");
    clearTranslationsWithColorsGroup("fruitsColors");
    clearTranslationsWithColorsGroup("flowersColors");
  }
  var transNeedlesColorsList = [
    [20, 9],
    [20, 10],
    [20, 6],
    [21, 10],
    [21, 9],
    [21, 6],
    [19, 7],
    [20, 7],
    [19, 9],
    [19, 6],
    [19, 8],
  ];
  var transFruitsColorsList = [
    [1, 9],
    [1, 2],
    [1, 6],
    [4, 6],
    [3, 5],
    [2, 7],
    [16, 7],
    [16, 8],
    [15, 8],
    [15, 9],
    [13, 8],
    [13, 9],
    [14, 8],
    [14, 9],
  ];
  var transLeafsColorsList = [
    [1, 9],
    [2, 10],
    [1, 6],
    [2, 2],
    [18, 6],
    [18, 4],
    [18, 8],
    [17, 6],
    [17, 5],
    [16, 7],
    [16, 8],
    [15, 8],
    [15, 9],
    [13, 8],
    [13, 9],
    [14, 8],
    [14, 9],
  ];
  var transFlowerColorsList = [
    [1, 1],
    [1, 2],
    [1, 3],
    [2, 1],
    [2, 3],
    [3, 1],
    [3, 2],
    [4, 3],
    [5, 1],
    [5, 2],
    [5, 3],
    [6, 1],
    [6, 2],
    [7, 1],
    [7, 3],
    [8, 1],
    [9, 1],
    [10, 1],
    [10, 2],
    [10, 3],
    [11, 1],
    [12, 1],
    [16, 7],
    [16, 8],
    [15, 8],
    [15, 9],
    [13, 8],
    [13, 9],
    [14, 8],
    [14, 9],
  ];
}
