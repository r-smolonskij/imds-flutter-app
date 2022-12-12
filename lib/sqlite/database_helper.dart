import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/sqlite/translation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();
  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "database.db");

    // Only copy if the database doesn't exist
    //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
    // Load database from asset and copy
    ByteData data = await rootBundle.load(join('assets/db', 'imds_new.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // Save copied asset to documents
    await new File(path).writeAsBytes(bytes);

    var ourDb = await openDatabase(path);
    return ourDb;
  }

  Future<List<Translation>> getTranslationsBySearchFilters(
      filtersObject) async {
    var dbClient = await db;
    var translationsIds = [];
    List<Translation> translations = [];
    if (filtersObject["plantTypeId"] != null) {
      var foundPlantType = plantsGroups.firstWhere(
          (group) => group.id == filtersObject["plantTypeId"],
          orElse: () => null);
      if (foundPlantType != null) {
        List<Map> translationsMap = await dbClient.rawQuery(
            "SELECT * FROM translations WHERE plant_group = '${foundPlantType.type}' AND plant_subgroup = '${foundPlantType.subType}' AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL);");
        if (translationsMap.length > 0) {
          for (int i = 0; i < translationsMap.length; i++) {
            translations.add(Translation.fromMap(translationsMap[i]));
            translationsIds.add(Translation.fromMap(translationsMap[i]).id);
          }
        }
      }
    }
    if (translationsIds.length > 0) {
      var plantPartsTables = {
        "flowerIdsList": "translations_flower_colors",
        "fruitIdsList": "translations_fruit_colors",
        "foliageIdsList": "translations_foliage_colors",
        "needlesIdsList": "translations_needles_colors",
        "monthsIdsList": "translations_flowering_months"
      };
      var properties = plantPartsTables.keys.toList();
      for (var property in properties) {
        var colorsOrMonthsIdsList = filtersObject[property];
        if (colorsOrMonthsIdsList != null && colorsOrMonthsIdsList.length > 0) {
          print("translationsIds => ${translationsIds}");
          List<Map> relationshipsMap = await dbClient.rawQuery(
              "SELECT translationId FROM ${plantPartsTables[property]} WHERE ${property == "monthsIdsList" ? 'month' : 'colorId'} IN (${colorsOrMonthsIdsList.join(',')}) AND translationId IN (${translationsIds.join(',')});");
          print(
              "SELECT translationId FROM ${plantPartsTables[property]} WHERE ${property == "monthsIdsList" ? 'month' : 'colorId'} IN (${colorsOrMonthsIdsList.join(',')}) AND translationId IN (${translationsIds.join(',')});");
          if (relationshipsMap.length > 0) {
            var relationshipTranslationsIds = [];
            for (int i = 0; i < relationshipsMap.length; i++) {
              relationshipTranslationsIds
                  .add(relationshipsMap[i]["translationId"]);
            }
            var newTranslationsIds = [...translationsIds]
                .where((translationId) =>
                    relationshipTranslationsIds.indexOf(translationId) > -1)
                .toList();
            translationsIds = [...newTranslationsIds];
          } else {
            translationsIds = [];
          }
        }
        await Future.delayed(const Duration(milliseconds: 50));
      }
    }
    var filteredTranslations = [...translations]
        .where((translation) => translationsIds.indexOf(translation.id) > -1)
        .toList();
    return filteredTranslations;
  }

  Future<List<int>> getPlantBodyPartColor(translationId, bodyPart) async {
    var dbClient = await db;
    var plantPartsTables = {
      "flower": "translations_flower_colors",
      "foliage": "translations_foliage_colors",
      "fruit": "translations_fruit_colors",
      "needles": "translations_needles_colors",
    };
    List<int> colorsIds = [];
    if (plantPartsTables[bodyPart] != null) {
      List<Map> relationshipsMap = await dbClient.rawQuery(
          "SELECT * FROM ${plantPartsTables[bodyPart]} WHERE translationId = ${translationId};");
      if (relationshipsMap.length > 0) {
        for (int i = 0; i < relationshipsMap.length; i++) {
          colorsIds.add(relationshipsMap[i]["colorId"]);
        }
      }
    }
    return colorsIds;
  }

  Future<List<int>> getUsedColorsByPlantPart(bodyPart) async {
    var dbClient = await db;
    var bodyPartsList = {
      "flower": "translations_flower_colors",
      "foliage": "translations_foliage_colors",
      "fruit": "translations_fruit_colors",
      "needles": "translations_needles_colors",
    };
    List<int> colorsIds = [];
    if (bodyPartsList[bodyPart] != null) {
      List<Map> relationshipsMap = await dbClient
          .rawQuery("SELECT DISTINCT colorId FROM ${bodyPartsList[bodyPart]};");
      if (relationshipsMap.length > 0) {
        for (int i = 0; i < relationshipsMap.length; i++) {
          colorsIds.add(relationshipsMap[i]["colorId"]);
        }
      }
    }
    return colorsIds;
  }

  Future<List<Translation>> getTranslationsByTranslationGroup(
      translationGroup) async {
    var dbClient = await db;
    List<Translation> translationsList = [];
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE translation_group = ${translationGroup} ORDER BY id;");
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translationsList.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translationsList;
  }

  Future<List<Translation>> getSemanticSearchTranslations(searchText) async {
    var dbClient = await db;
    List<Translation> translations = [];
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE la LIKE '%${searchText}%' AND root IS NOT NULL AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL);;");
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translations.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translations;
  }

  Future<List<Translation>> getSemanticTranslationsByParentLatinName(
      parentLatinName) async {
    var dbClient = await db;
    List<Translation> translations = [];
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE root = '${parentLatinName}';");
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translations.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translations;
  }

  Future<Translation> getTranslationById(translationId) async {
    var dbClient = await db;
    var translationItem;
    List<Map> translationsMap = await dbClient
        .rawQuery("SELECT * FROM translations WHERE id = ${translationId};");
    if (translationsMap.length > 0) {
      translationItem = Translation.fromMap(translationsMap[0]);
    }
    return translationItem;
  }

  Future<Translation> getTranslationByLatinName(latinName) async {
    var dbClient = await db;
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE la = '${latinName}' AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL) LIMIT 1;");
    Translation translation;
    if (translationsMap.length > 0) {
      translation = Translation.fromMap(translationsMap[0]);
    }
    return translation;
  }

  Future<List<Translation>> getTranslationByLanguageAndSearchText(
      searchText, languageProperty) async {
    var dbClient = await db;
    // print(
    //     "SELECT * FROM translations WHERE ${languageProperty} LIKE '%${searchText}%' AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL);");
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE ${languageProperty} LIKE '%${searchText}%' AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL);");
    List<Translation> translations = [];
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translations.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translations;
  }

  Future<List<Translation>> getTranslationBySearchText(searchText) async {
    var dbClient = await db;
    List<Map> translationsMap = await dbClient.rawQuery(
        "SELECT * FROM translations WHERE lv LIKE '%${searchText}%' OR la LIKE '%${searchText}%' OR en LIKE '%${searchText}%' OR de LIKE '%${searchText}%' OR ru LIKE '%${searchText}%' AND (lv_prio = 1 OR lv_prio IS NULL) AND (ru_prio = 1 OR ru_prio IS NULL) AND (de_prio = 1 OR de_prio IS NULL)");
    List<Translation> translations = [];
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translations.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translations;
  }

  Future<List<Translation>> getAllTranslations() async {
    var dbClient = await db;
    List<Map> translationsMap =
        await dbClient.rawQuery("SELECT * FROM translations");
    List<Translation> translations = [];
    if (translationsMap.length > 0) {
      for (int i = 0; i < translationsMap.length; i++) {
        translations.add(Translation.fromMap(translationsMap[i]));
      }
    }
    return translations;
  }

  // Future<int> getObjectsCount() async {
  //   var dbClient = await db;
  //   return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM objects'));
  // }
  // Future<List<Field>> getFields() async {
  //   var dbClient = await db;
  //   //List<Map> maps = await dbClient.rawQuery("SELECT * FROM mytable( SELECT  *, ROW_NUMBER() OVER (PARTITION BY fieldID ORDER BY field DESC) rn FROM mytable)WHERE   rn = 1");
  //   List<Map> maps = await dbClient.rawQuery("SELECT DISTINCT fieldID, field FROM objects ORDER BY field");
  //   List<Field> fields = [];

  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       fields.add(Field.fromMap(maps[i]));
  //     }
  //   }

  //   return fields;
  // }
  // Future<Field> getFieldByID(int ID) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.rawQuery("SELECT DISTINCT fieldID, field FROM objects WHERE fieldID = "+ ID.toString());
  //   List<Field> fields = [];
  //   fields.add(Field.fromMap(maps[0]));
  //   return fields[0];
  // }

  // Future<List<Word>> getWords() async {
  //   var dbClient = await db;
  //   //List<Map> maps = await dbClient.rawQuery("SELECT * FROM mytable( SELECT  *, ROW_NUMBER() OVER (PARTITION BY fieldID ORDER BY field DESC) rn FROM mytable)WHERE   rn = 1");
  //   List<Map> maps = await dbClient.rawQuery("SELECT DISTINCT wordID, wordLV, wordENG, type  FROM objects");
  //   List<Word> words = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       words.add(Word.fromMap(maps[i]));
  //     }
  //   }
  //   return words;
  // }
  // Future<int> getFieldsCount() async {
  //   var dbClient = await db;
  //   return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(DISTINCT fieldID) FROM objects'));
  // }

  // Future<int> getWordsCount() async {
  //   var dbClient = await db;
  //   return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(DISTINCT wordID) FROM objects'));
  // }
  // Future<List<Word>> getWordsByFieldID(int fieldID) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.rawQuery("SELECT DISTINCT wordID, wordLV, wordENG, type  FROM objects WHERE fieldID = " + fieldID.toString() +";");
  //   List<Word> words = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       words.add(Word.fromMap(maps[i]));
  //     }
  //   }
  //   return words;
  // }
  // Future<List<Field>> getFieldsByWordID(int wordID) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.rawQuery("SELECT DISTINCT fieldID, field FROM objects WHERE wordID = " + wordID.toString() +";");
  //   List<Field> fields = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       fields.add(Field.fromMap(maps[i]));
  //     }
  //   }
  //   return fields;
  // }
  // Future<Word> getWordByID(int ID) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.rawQuery("SELECT * FROM objects WHERE wordID = "+ ID.toString());
  //   List<Word> words = [];
  //   words.add(Word.fromMap(maps[0]));
  //   return words[0];
  // }

}
