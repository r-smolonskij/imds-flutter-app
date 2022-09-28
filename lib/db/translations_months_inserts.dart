import 'dart:io';

import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

class TranslationWithMonthsInserts {
  Store _store;
  var transMonthsBox, transBox;

  void clearAllTranslationsWithMonths() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transMonthsBox = _store.box<TranslationWithMonths>();
      transMonthsBox.removeAll();
    });
  }

  void addInserts() {
    getApplicationDocumentsDirectory().then((Directory dir) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      transBox = _store.box<Translation>();
      transMonthsBox = _store.box<TranslationWithMonths>();
      transMonthsList.map((e) {
        var foundMonthsQuery = transMonthsBox
            .query(TranslationWithMonths_.translationID
                .equals(e[0])
                .and(TranslationWithMonths_.monthNumber.equals(e[1])))
            .build();
        if (foundMonthsQuery.count() == 0) {
          transMonthsBox.put(
              TranslationWithMonths(translationID: e[0], monthNumber: e[1]));
        }
      }).toList();
    });
  }

  var transMonthsList = [
    [1, 9],
    [1, 10],
    [1, 6],
  ];
}
