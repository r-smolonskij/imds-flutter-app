import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

class TranslationWithNeedlesColorsInserts {
  Store _store;
  var transNeedlesColorsBox, transBox, transColorBox;
  void clearAllTranslationsWithNeedlesColors() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transNeedlesColorsBox = _store.box<TranslationWithNeedlesColor>();
      transNeedlesColorsBox.removeAll();
    });
  }

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transBox = _store.box<Translation>();
      transColorBox = _store.box<TranslationWithNeedlesColor>();
      var needlesColorBox = _store.box<NeedlesColors>();

      transNeedlesColorsList.map((e) {
        var foundNeedlesColorsQuery = transColorBox
            .query(TranslationWithNeedlesColor_.translationID
                .equals(e[0])
                .and(TranslationWithNeedlesColor_.colorID.equals(e[1])))
            .build();
        if (foundNeedlesColorsQuery.count() == 0) {
          transColorBox.put(
              TranslationWithNeedlesColor(translationID: e[0], colorID: e[1]));
        }
        var foundNeedleColor = needlesColorBox.get(e[1]);
        if (foundNeedleColor == null) {
          needlesColorBox.put(NeedlesColors(id: e[1], colorID: e[1]));
        }
      }).toList();
    });
  }

  var transNeedlesColorsList = [
    [1, 9],
    [1, 10],
    [1, 6],
  ];
}
