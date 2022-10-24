import 'package:flutterTestApp/spell_checker/spell_checker.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';

bool isLoggedIn = false;
var globalWordsChecker = new SingleWordSpellChecker(distance: 1.0);
DatabaseHelper dbHelper = DatabaseHelper();

addWords() async {
  dbHelper.getAllTranslations().then((translations) {
    for (var i = 0; i < translations.length; i++) {
      globalWordsChecker.addWords([
        translations[i].la ?? "",
        translations[i].lv ?? "",
        translations[i].en ?? "",
        translations[i].de ?? "",
        translations[i].ru ?? ""
      ]);
    }
  });
  await Future.delayed(const Duration(milliseconds: 1000));
}
