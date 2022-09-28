import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/models/PlantTypeModel.dart';
import 'package:path_provider/path_provider.dart';

class TranslationWithFlowerColorsInserts {
  Store _store;
  var transPlantBox, transColorBox;

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transColorBox = _store.box<TranslationWithFlowersColor>();
      var flowersColorBox = _store.box<FlowersColors>();

      transFlowerColorsList.map((e) {
        var foundFlowerColorsQuery = transColorBox
            .query(TranslationWithFlowersColor_.translationID
                .equals(e[0])
                .and(TranslationWithFlowersColor_.colorID.equals(e[1])))
            .build();
        if (foundFlowerColorsQuery.count() == 0) {
          transColorBox.put(
              TranslationWithFlowersColor(translationID: e[0], colorID: e[1]));
        }
        var foundFlowerColor = flowersColorBox.get(e[1]);
        if (foundFlowerColor == null) {
          flowersColorBox.put(FlowersColors(id: e[1], colorID: e[1]));
        }
      }).toList();
    });
  }

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
  ];
}
