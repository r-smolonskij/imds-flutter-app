library my_prj.globals;

import 'dart:io';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spell_checker/spell_checker.dart';

bool isLoggedIn = false;
var globalWordsChecker = new SingleWordSpellChecker(distance: 1.0);

void addWords() {
  var transBox, _store;
  getApplicationDocumentsDirectory().then((Directory dir) {
    _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');

    transBox = _store.box<Translation>();
    var translations = transBox.query().build();
    var foundList = translations.find();
    for (var i = 0; i < foundList.length; i++) {
      print(foundList[i].la);
      globalWordsChecker.addWords([
        foundList[i].la ?? "",
        foundList[i].lv ?? "",
        foundList[i].en ?? "",
        foundList[i].de ?? "",
        foundList[i].ru ?? ""
      ]);
      // print(foundList[i].la);
      // globalWordsChecker.addWord(foundList[i].la.toString());
      // if (foundList[i].la.length > 0) {
      //   print(foundList[i].la);
      //   globalWordsChecker.addWord(foundList[i].la);
      // } else {
      //   print("noooooooooooooooooo");
      // }
      // globalWordsChecker.addWords([
      //   foundList[i].la,
      //   foundList[i].lv,
      //   foundList[i].en,
      //   foundList[i].de,
      //   foundList[i].ru
      // ]);
    }
  });
  // globalWordsChecker.addWords();
}
