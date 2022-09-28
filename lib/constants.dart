import 'package:flutter/material.dart';

class Piktogramma {
  String iconPath;
  String title;
  int id;

  Piktogramma(int id, String title, String iconPath) {
    this.id = id;
    this.title = title;
    this.iconPath = iconPath;
  }
}

List romanNumbers = [
  ['I', 1],
  ['II', 2],
  ['III', 3],
  ['IV', 4],
  ['V', 5],
  ['VI', 6],
  ['VII', 7],
  ['VIII', 8],
  ['IX', 9],
  ['X', 10],
  ['XI', 11],
  ['XII', 12],
];

var monthsList = [
  {"id": 0, "number": "I", "lv_month": "Janvāris", "is_selected": false},
  {"id": 1, "number": "II", "lv_month": "Februāris", "is_selected": false},
  {"id": 2, "number": "III", "lv_month": "Marts", "is_selected": false},
  {"id": 3, "number": "IV", "lv_month": "Aprīlis", "is_selected": false},
  {"id": 4, "number": "V", "lv_month": "Maijs", "is_selected": false},
  {"id": 5, "number": "VI", "lv_month": "Jūnijs", "is_selected": false},
  {"id": 6, "number": "VII", "lv_month": "Jūlijs", "is_selected": false},
  {"id": 7, "number": "VIII", "lv_month": "Augusts", "is_selected": false},
  {"id": 8, "number": "IX", "lv_month": "Septembris", "is_selected": false},
  {"id": 9, "number": "X", "lv_month": "Oktobris", "is_selected": false},
  {"id": 10, "number": "XI", "lv_month": "Novembris", "is_selected": false},
  {"id": 11, "number": "XII", "lv_month": "Decembris", "is_selected": false},
];

List<Piktogramma> piktogrammasList = [
  new Piktogramma(
      1, "Auglu_krasa", "assets/icons/piktogrammas/Auglu_krasa.png"),
  new Piktogramma(2, "Kokaugi", "assets/icons/piktogrammas/Kokaugi.png"),
  new Piktogramma(3, "Lakstaugs", "assets/icons/piktogrammas/Lakstaugs.png"),
  new Piktogramma(4, "Lakstaugs_daudzgadigs",
      "assets/icons/piktogrammas/Lakstaugs_daudzgadigs.png"),
  new Piktogramma(5, "Lakstaugs_viengadiigs",
      "assets/icons/piktogrammas/Lakstaugs_viengadiigs.png"),
  new Piktogramma(6, "Lapu_koks", "assets/icons/piktogrammas/Lapu_koks.png"),
  new Piktogramma(7, "Lapu_krasa", "assets/icons/piktogrammas/Lapu_krasa.png"),
  new Piktogramma(8, "Lapu_krums", "assets/icons/piktogrammas/Lapu_krums.png"),
  new Piktogramma(9, "Liana", "assets/icons/piktogrammas/Liana.png"),
  new Piktogramma(10, "Skuju_koks", "assets/icons/piktogrammas/Skuju_koks.png"),
  new Piktogramma(
      11, "Skuju_krasa", "assets/icons/piktogrammas/Skuju_krasa.png"),
  new Piktogramma(
      12, "Skuju_krums", "assets/icons/piktogrammas/Skuju_krums.png"),
  new Piktogramma(13, "Telpaugs", "assets/icons/piktogrammas/Telpaugs.png"),
  new Piktogramma(
      14, "Ziedu_krasa", "assets/icons/piktogrammas/Ziedu_krasa.png"),
];

const LinearGradient kDefaultLinearGradient = LinearGradient(
  colors: [
    const Color(0xFF74E4417),
    const Color(0xFF747136),
    const Color(0xFFC2BE66),
    const Color(0xFFf0ec74),
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(1.2, 0.0),
  stops: [0.0, 0.35, 0.75, 1.0],
  tileMode: TileMode.clamp,
);

const Color kDefaultColor = Color(0xFF149414);
const Color kSecondaryColor = Color(0xFFD5B85A);
