import 'package:objectbox/objectbox.dart';
import 'package:flutterTestApp/models/PlantTypeModel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
// @Entity()
// class Note {
//   int id;
//   String text;
//   Note({this.text});
//   // Note: just for logs in the examples below(), not needed by ObjectBox.
//   toString() => 'Note{id: $id, text: $text}';
// }

@Entity()
class Translation {
  @Id()
  int id;
  int wordsGroupId;
  String lv;
  String lv_apz;
  int lv_prio;
  String la;
  String en;
  String de;
  String de_apz;
  int de_prio;
  String ru;
  String ru_apz;
  int ru_prio;
  // String wiki_link;
  String piezimes;
  String attela_links;
  // String def_tez;
  String link_tez;
  // String info;
  bool showLA;
  bool showLV;
  bool showEN;
  bool showDE;
  bool showRU;
  int plantTypeID;

  Translation({
    this.id,
    this.wordsGroupId,
    this.lv,
    this.lv_apz,
    this.lv_prio,
    this.la,
    this.en,
    this.de,
    this.de_apz,
    this.de_prio,
    this.ru,
    this.ru_apz,
    this.ru_prio,
    this.attela_links,
    this.piezimes,
    this.link_tez,
    this.showLA,
    this.showLV,
    this.showEN,
    this.showDE,
    this.showRU,
    this.plantTypeID: 0,
    // this.wiki_link,
    // this.piezimes,

    // // this.def_tez,
    // this.link_tez,
    // this.info
  });
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  toString() => 'Translation{id: $id, wordsGroupId: $wordsGroupId}';
}

@Entity()
class CustomColor {
  // @Id(assignable: true)
  int id;
  @Unique()
  int colorIndex;
  String title;
  String colorCode;
  CustomColor({this.id, this.colorIndex, this.title, this.colorCode});
  toString() =>
      'CustomColor{id: $id, colorIndex: $colorIndex, title: $title, code: $colorCode}';
}

@Entity()
class PlantType {
  // @Id(assignable: true)
  int id;
  String title;
  PlantType({this.id, this.title});
  toString() => "PlantType{id: $id, title: $title}";
}

@Entity()
class FlowersColors {
  // @Id(assignable: true)
  int id;
  int colorID;
  FlowersColors({this.id, this.colorID});
  toString() => "FlowersColors{id: $id, colorID: $colorID}";
}

@Entity()
class LeafsColors {
  // @Id(assignable: true)
  int id;
  int colorID;
  LeafsColors({this.id, this.colorID});
  toString() => "LeafsColors{id: $id, colorID: $colorID}";
}

@Entity()
class NeedlesColors {
  // @Id(assignable: true)
  int id;
  int colorID;
  NeedlesColors({this.id, this.colorID});
  toString() => "NeedlesColors{id: $id, colorID: $colorID}";
}

@Entity()
class FruitsColors {
  // @Id(assignable: true)
  int id;
  int colorID;
  FruitsColors({this.id, this.colorID});
  toString() => "FruitsColors{id: $id, colorID: $colorID}";
}

@Entity()
class TranslationWithPlantType {
  // @Id(assignable: true)
  int id;
  int translationID;
  int plantTypeID;
  TranslationWithPlantType({this.id, this.translationID, this.plantTypeID});
  toString() =>
      "TranslationWithPlantType{translation: $translationID, plantType: $plantTypeID}";
}

@Entity()
class TranslationWithFlowersColor {
  // @Id(assignable: true)
  int id;

  int translationID;
  int colorID;
  TranslationWithFlowersColor({this.id, this.translationID, this.colorID});
  toString() =>
      "TranslationWithFlowersColor{translation: $translationID, colorID: $colorID}";
}

@Entity()
class TranslationWithFruitsColor {
  // @Id(assignable: true)
  int id;

  int translationID;
  int colorID;
  TranslationWithFruitsColor({this.id, this.translationID, this.colorID});
  toString() =>
      "TranslationWithFruitsColor{translation: $translationID, colorID: $colorID}";
}

@Entity()
class TranslationWithLeafsColor {
  // @Id(assignable: true)
  int id;

  int translationID;
  int colorID;
  TranslationWithLeafsColor({this.id, this.translationID, this.colorID});
  toString() =>
      "TranslationWithLeafsColor{translation: $translationID, colorID: $colorID}";
}

@Entity()
class TranslationWithNeedlesColor {
  // @Id(assignable: true)
  int id;
  int translationID;
  int colorID;
  TranslationWithNeedlesColor({this.id, this.translationID, this.colorID});
  toString() =>
      "TranslationWithNeedlesColor{translation: $translationID, colorID: $colorID}";
}

@Entity()
class TranslationWithMonths {
  // @Id(assignable: true)
  int id;

  int translationID;
  int monthNumber;
  TranslationWithMonths({this.id, this.translationID, this.monthNumber});
  toString() =>
      "TranslationWithMonths{translation: $translationID, monthNumber: $monthNumber}";
}
