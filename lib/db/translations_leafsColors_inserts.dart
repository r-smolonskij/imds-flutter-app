import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

class TranslationWithLeafsColorsInserts {
  Store _store;
  var transLeafColorsBox, transColorBox;

  void clearAllTranslationsWithLeafsColors() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transLeafColorsBox = _store.box<TranslationWithLeafsColor>();
      transLeafColorsBox.removeAll();
    });
  }

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transColorBox = _store.box<TranslationWithLeafsColor>();
      var leafsColorBox = _store.box<LeafsColors>();

      transLeafsColorsList.map((e) {
        var foundLeafsColorsQuery = transColorBox
            .query(TranslationWithLeafsColor_.translationID
                .equals(e[0])
                .and(TranslationWithLeafsColor_.colorID.equals(e[1])))
            .build();
        if (foundLeafsColorsQuery.count() == 0) {
          transColorBox.put(
              TranslationWithLeafsColor(translationID: e[0], colorID: e[1]));
        }
        var foundLeafColor = leafsColorBox.get(e[1]);
        if (foundLeafColor == null) {
          leafsColorBox.put(LeafsColors(id: e[1], colorID: e[1]));
        }
      }).toList();
    });
  }

  var transLeafsColorsList = [
    [1, 9],
    [2, 10],
    [1, 6],
    [2, 2],
    [4, 6],
  ];
}
