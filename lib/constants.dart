import 'package:flutter/material.dart';

const imagesBackgroundColor = Color(0xFFf0ec74);

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

class PlantGroup {
  String imageName;
  String type;
  String subType;
  String text;
  int id;

  PlantGroup(
    int id,
    String imageName,
    String type,
    String subType,
    String text,
  ) {
    this.text = text;
    this.imageName = imageName;
    this.type = type;
    this.subType = subType;
    this.id = id;
  }
}

List languages = ["la", "lv", "en", "de", "ru"];

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
  {
    "id": 1,
    "number": "I",
    "month_translation": "january",
    "is_selected": false
  },
  {
    "id": 2,
    "number": "II",
    "month_translation": "february",
    "is_selected": false
  },
  {
    "id": 3,
    "number": "III",
    "month_translation": "march",
    "is_selected": false
  },
  {"id": 4, "number": "IV", "month_translation": "april", "is_selected": false},
  {"id": 5, "number": "V", "month_translation": "may", "is_selected": false},
  {"id": 6, "number": "VI", "month_translation": "june", "is_selected": false},
  {"id": 7, "number": "VII", "month_translation": "july", "is_selected": false},
  {
    "id": 8,
    "number": "VIII",
    "month_translation": "august",
    "is_selected": false
  },
  {
    "id": 9,
    "number": "IX",
    "month_translation": "september",
    "is_selected": false
  },
  {
    "id": 10,
    "number": "X",
    "month_translation": "october",
    "is_selected": false
  },
  {
    "id": 11,
    "number": "XI",
    "month_translation": "november",
    "is_selected": false
  },
  {
    "id": 12,
    "number": "XII",
    "month_translation": "december",
    "is_selected": false
  },
];

var gamesList = {
  "monthlyQuestions": "monthly_questions",
  "putTogether": "put_together",
  "writeCorrect": "write_correct",
};

List<Piktogramma> piktogrammasList = [
  new Piktogramma(
      1, "Auglu_krasa", "assets/images/piktogrammas/Auglu_krasa.png"),
  new Piktogramma(2, "Kokaugi", "assets/images/piktogrammas/Kokaugi.png"),
  new Piktogramma(3, "Lakstaugs", "assets/images/piktogrammas/Lakstaugs.png"),
  new Piktogramma(4, "Lakstaugs_daudzgadigs",
      "assets/images/piktogrammas/Lakstaugs_daudzgadigs.png"),
  new Piktogramma(5, "Lakstaugs_viengadiigs",
      "assets/images/piktogrammas/Lakstaugs_viengadiigs.png"),
  new Piktogramma(6, "Lapu_koks", "assets/images/piktogrammas/Lapu_koks.png"),
  new Piktogramma(7, "Lapu_krasa", "assets/images/piktogrammas/Lapu_krasa.png"),
  new Piktogramma(8, "Lapu_krums", "assets/images/piktogrammas/Lapu_krums.png"),
  new Piktogramma(9, "Liana", "assets/images/piktogrammas/Liana.png"),
  new Piktogramma(
      10, "Skuju_koks", "assets/images/piktogrammas/Skuju_koks.png"),
  new Piktogramma(
      11, "Skuju_krasa", "assets/images/piktogrammas/Skuju_krasa.png"),
  new Piktogramma(
      12, "Skuju_krums", "assets/images/piktogrammas/Skuju_krums.png"),
  new Piktogramma(13, "Telpaugs", "assets/images/piktogrammas/Telpaugs.png"),
  new Piktogramma(
      14, "Ziedu_krasa", "assets/images/piktogrammas/Ziedu_krasa.png"),
];

List<PlantGroup> plantsGroups = [
  new PlantGroup(0, "Viengadigs_lakstaugs.png", "lakstaugs", "viengadīgs",
      "viengadigs_lakstaugs"),
  new PlantGroup(1, "Daudzgadigs_lakstaugs.png", "lakstaugs", "daudzgadīgs",
      "daudzgadigs_lakstaugs"),
  new PlantGroup(2, "Lapu_krums.png", "krūms", "lapu krūms", "leaf_bush"),
  new PlantGroup(3, "Skuju_krums.png", "krūms", "skuju krūms", "needle_bush"),
  new PlantGroup(4, "Lapu_koks.png", "koks", "lapu koks", "leafy_tree"),
  new PlantGroup(5, "Skuju_koks.png", "koks", "skuju koks", "needle_tree"),
  new PlantGroup(6, "Liana.png", "liāna", null, "liana"),
  new PlantGroup(7, "Telpaugs.png", "telpaugs", null, "indoor_plant"),
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

const plantColors = [
  {
    "id": 1,
    "color_translation": "white",
    "color_lv": "Balti",
    "hexCode": "FFFFFF"
  },
  {
    "id": 2,
    "color_translation": "yellow",
    "color_lv": "Dzelteni",
    "hexCode": "FFFF00"
  },
  {
    "id": 3,
    "color_translation": "orange",
    "color_lv": "Oranži",
    "hexCode": "FFA500"
  },
  {
    "id": 4,
    "color_translation": "light_red",
    "color_lv": "Gaiši sarkani",
    "hexCode": "FF6347"
  },
  {
    "id": 5,
    "color_translation": "red",
    "color_lv": "Sarkani",
    "hexCode": "FF0000"
  },
  {
    "id": 6,
    "color_translation": "dark_red",
    "color_lv": "Tumši sarkani",
    "hexCode": "8B0000"
  },
  {
    "id": 7,
    "color_translation": "lime",
    "color_lv": "Laima",
    "hexCode": "00FF00"
  },
  {
    "id": 8,
    "color_translation": "light_green",
    "color_lv": "Gaiši zaļi",
    "hexCode": "90EE90"
  },
  {
    "id": 9,
    "color_translation": "green",
    "color_lv": "Zaļš",
    "hexCode": "008000"
  },
  {
    "id": 10,
    "color_translation": "dark_green",
    "color_lv": "Tumši zaļi",
    "hexCode": "006400"
  },
  {
    "id": 11,
    "color_translation": "light_blue",
    "color_lv": "Gaiši zili",
    "hexCode": "ADD8E6"
  },
  {
    "id": 12,
    "color_translation": "blue",
    "color_lv": "Zili",
    "hexCode": "0000FF"
  },
  {
    "id": 13,
    "color_translation": "dark_blue",
    "color_lv": "Tumši zili",
    "hexCode": "00008B"
  },
  {
    "id": 14,
    "color_translation": "brown",
    "color_lv": "Brūni",
    "hexCode": "A52A2A"
  },
  {
    "id": 15,
    "color_translation": "purple",
    "color_lv": "Violeti",
    "hexCode": "C71585"
  },
  {
    "id": 16,
    "color_translation": "pink",
    "color_lv": "Rozā",
    "hexCode": "FFC0CB"
  },
  {
    "id": 17,
    "color_translation": "black",
    "color_lv": "Melni",
    "hexCode": "000000"
  }
];

var flagsByCountryCode = {
  "la": "assets/images/latin_flag_circular.png",
  "lv": "assets/images/latvian_flag_circular.png",
  "en": "assets/images/uk_flag_circular.png",
  "ru": "assets/images/russian_flag_circular.png",
  "de": "assets/images/german_flag_circular.png"
};

const tipsByMonth = [
  {
    "monthId": 1,
    "tips": ["Janvāris 1", "Janvāris 2", "Janvāris 3", "Janvāris 4"]
  },
  {
    "monthId": 2,
    "tips": ["Februāris 1", "Februāris 2", "Februāris 3", "Februāris 4"]
  },
  {
    "monthId": 3,
    "tips": ["Marts 1", "Marts 2", "Marts 3", "Marts 4"]
  },
  {
    "monthId": 4,
    "tips": ["Aprīlis 1", "Aprīlis 2", "Aprīlis 3", "Aprīlis 4"]
  },
  {
    "monthId": 5,
    "tips": ["Maijs 1", "Maijs 2", "Maijs 3", "Maijs 4"]
  },
  {
    "monthId": 6,
    "tips": ["Jūnijs 1", "Jūnijs 2", "Jūnijs 3", "Jūnijs 4"]
  },
  {
    "monthId": 7,
    "tips": ["Jūlijs 1", "Jūlijs 2", "Jūlijs 3", "Jūlijs 4"]
  },
  {
    "monthId": 8,
    "tips": ["Augusts 1", "Augusts 2", "Augusts 3", "Augusts 4"]
  },
  {
    "monthId": 9,
    "tips": ["Septembris 1", "Septembris 2", "Septembris 3", "Septembris 4"]
  },
  {
    "monthId": 10,
    "tips": [
      'Oktobris 1, \n Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
      "Oktobris 2",
      "Oktobris 3",
      "Oktobris 4"
    ]
  },
  {
    "monthId": 11,
    "tips": ["Novembris 1", "Novembris 2", "Novembris 3", "Novembris 4"]
  },
  {
    "monthId": 12,
    "tips": ["Decembris 1", "Decembris 2", "Decembris 3", "Decembris 4"]
  },
];

const monthsPlantGame = [
  {
    "monthId": 1,
    "lv": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    },
    "en": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    },
    "de": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    },
    "ru": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    }
  },
  {
    "monthId": 2,
    "lv": {
      "plantName": "Roze – genus Rosa",
      "questions": [
        {
          "question": " Kuros svētkos februārī visbiežāk tiek dāvinātas rozes?",
          "answers": [
            "Ķīniešu jaunajā gadā 1. februārī (2022.gadā)",
            "Lietuvas Republikas neatkarības dienā 16. februārī",
            "Valentīndienā 14. februārī",
            "Starptautiskajā sieviešu un meiteņu dienā zinātnē 11. februārī",
          ],
          "correctAnswer": "Valentīndienā 14. februārī"
        },
        {
          "question": "Senākos laikos Latvijā rozes mēdza saukt par?",
          "answers": [
            "Rūži",
            "Rūzi",
            "Rozu",
            "Ruezi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Cik gadu ir pasaulē vecākajām rožu dzimtas fosilijām?",
          "answers": [
            "8000 gadu",
            "35 miljoni gadu",
            "40000 gadu",
            "135000 gadu ",
          ],
          "correctAnswer": "35 miljoni gadu"
        },
        {
          "question": "Kurā valstī izcēlās Sarkanās un Baltās rozes karš?",
          "answers": [
            "Igaunijā",
            "Senajā Romā",
            "Francijā",
            "Anglijā",
          ],
          "correctAnswer": "Anglijā"
        },
        {
          "question":
              "Kāpēc no rozēm darinātais rožūdens tiek izmantots sejas kopšanas līdzekļos?",
          "answers": [
            "Mārketinga nolūkos, skan lab",
            "Pretiekaisuma īpašību dēļ",
            "Taukainas sejas ādas ārstēšanai ",
            "Aromātisko īpašību dēļ",
          ],
          "correctAnswer": "Pretiekaisuma īpašību dēļ"
        },
        {
          "question": "Vai dabā ir sastopamas varavīksnes rozes?",
          "answers": [
            "Jā",
            "Nē",
          ],
          "correctAnswer": "Nē"
        },
      ]
    },
    "en": {
      "plantName": "Roze – genus Rosa",
      "questions": [
        {
          "question": " Kuros svētkos februārī visbiežāk tiek dāvinātas rozes?",
          "answers": [
            "Ķīniešu jaunajā gadā 1. februārī (2022.gadā)",
            "Lietuvas Republikas neatkarības dienā 16. februārī",
            "Valentīndienā 14. februārī",
            "Starptautiskajā sieviešu un meiteņu dienā zinātnē 11. februārī",
          ],
          "correctAnswer": "Valentīndienā 14. februārī"
        },
        {
          "question": "Senākos laikos Latvijā rozes mēdza saukt par?",
          "answers": [
            "Rūži",
            "Rūzi",
            "Rozu",
            "Ruezi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Cik gadu ir pasaulē vecākajām rožu dzimtas fosilijām?",
          "answers": [
            "8000 gadu",
            "35 miljoni gadu",
            "40000 gadu",
            "135000 gadu ",
          ],
          "correctAnswer": "35 miljoni gadu"
        },
        {
          "question": "Kurā valstī izcēlās Sarkanās un Baltās rozes karš?",
          "answers": [
            "Igaunijā",
            "Senajā Romā",
            "Francijā",
            "Anglijā",
          ],
          "correctAnswer": "Anglijā"
        },
        {
          "question":
              "Kāpēc no rozēm darinātais rožūdens tiek izmantots sejas kopšanas līdzekļos?",
          "answers": [
            "Mārketinga nolūkos, skan lab",
            "Pretiekaisuma īpašību dēļ",
            "Taukainas sejas ādas ārstēšanai ",
            "Aromātisko īpašību dēļ",
          ],
          "correctAnswer": "Pretiekaisuma īpašību dēļ"
        },
        {
          "question": "Vai dabā ir sastopamas varavīksnes rozes?",
          "answers": [
            "Jā",
            "Nē",
          ],
          "correctAnswer": "Nē"
        },
      ]
    },
    "de": {
      "plantName": "Roze – genus Rosa",
      "questions": [
        {
          "question": " Kuros svētkos februārī visbiežāk tiek dāvinātas rozes?",
          "answers": [
            "Ķīniešu jaunajā gadā 1. februārī (2022.gadā)",
            "Lietuvas Republikas neatkarības dienā 16. februārī",
            "Valentīndienā 14. februārī",
            "Starptautiskajā sieviešu un meiteņu dienā zinātnē 11. februārī",
          ],
          "correctAnswer": "Valentīndienā 14. februārī"
        },
        {
          "question": "Senākos laikos Latvijā rozes mēdza saukt par?",
          "answers": [
            "Rūži",
            "Rūzi",
            "Rozu",
            "Ruezi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Cik gadu ir pasaulē vecākajām rožu dzimtas fosilijām?",
          "answers": [
            "8000 gadu",
            "35 miljoni gadu",
            "40000 gadu",
            "135000 gadu ",
          ],
          "correctAnswer": "35 miljoni gadu"
        },
        {
          "question": "Kurā valstī izcēlās Sarkanās un Baltās rozes karš?",
          "answers": [
            "Igaunijā",
            "Senajā Romā",
            "Francijā",
            "Anglijā",
          ],
          "correctAnswer": "Anglijā"
        },
        {
          "question":
              "Kāpēc no rozēm darinātais rožūdens tiek izmantots sejas kopšanas līdzekļos?",
          "answers": [
            "Mārketinga nolūkos, skan lab",
            "Pretiekaisuma īpašību dēļ",
            "Taukainas sejas ādas ārstēšanai ",
            "Aromātisko īpašību dēļ",
          ],
          "correctAnswer": "Pretiekaisuma īpašību dēļ"
        },
        {
          "question": "Vai dabā ir sastopamas varavīksnes rozes?",
          "answers": [
            "Jā",
            "Nē",
          ],
          "correctAnswer": "Nē"
        },
      ]
    },
    "ru": {
      "plantName": "Roze – genus Rosa",
      "questions": [
        {
          "question": " Kuros svētkos februārī visbiežāk tiek dāvinātas rozes?",
          "answers": [
            "Ķīniešu jaunajā gadā 1. februārī (2022.gadā)",
            "Lietuvas Republikas neatkarības dienā 16. februārī",
            "Valentīndienā 14. februārī",
            "Starptautiskajā sieviešu un meiteņu dienā zinātnē 11. februārī",
          ],
          "correctAnswer": "Valentīndienā 14. februārī"
        },
        {
          "question": "Senākos laikos Latvijā rozes mēdza saukt par?",
          "answers": [
            "Rūži",
            "Rūzi",
            "Rozu",
            "Ruezi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Cik gadu ir pasaulē vecākajām rožu dzimtas fosilijām?",
          "answers": [
            "8000 gadu",
            "35 miljoni gadu",
            "40000 gadu",
            "135000 gadu ",
          ],
          "correctAnswer": "35 miljoni gadu"
        },
        {
          "question": "Kurā valstī izcēlās Sarkanās un Baltās rozes karš?",
          "answers": [
            "Igaunijā",
            "Senajā Romā",
            "Francijā",
            "Anglijā",
          ],
          "correctAnswer": "Anglijā"
        },
        {
          "question":
              "Kāpēc no rozēm darinātais rožūdens tiek izmantots sejas kopšanas līdzekļos?",
          "answers": [
            "Mārketinga nolūkos, skan lab",
            "Pretiekaisuma īpašību dēļ",
            "Taukainas sejas ādas ārstēšanai ",
            "Aromātisko īpašību dēļ",
          ],
          "correctAnswer": "Pretiekaisuma īpašību dēļ"
        },
        {
          "question": "Vai dabā ir sastopamas varavīksnes rozes?",
          "answers": [
            "Jā",
            "Nē",
          ],
          "correctAnswer": "Nē"
        },
      ]
    },
  },
  {
    "monthId": 3,
    "lv": {
      "plantName": "Krokuss",
      "questions": [
        {
          "question":
              "Kurā vēstures laikmetā krokusi tika pirmo reizi ievēroti?",
          "answers": ["Akmens laikmetā", "Bronzas laikmetā", "Dzels laikmetā"],
          "correctAnswer": "Bronzas laikmetā"
        },
        {
          "question": "Pie kuras puķu dzimtas pieder krokusi?",
          "answers": [
            "Īrisu dzimtas",
            "Rožu dzimtas",
            "Neļķu dzimtas",
            "Amariļļu dzimtas",
          ],
          "correctAnswer": "Īrisu dzimtas"
        },
        {
          "question":
              "Kā sauc pasaulē dārgāko garšvielu, kuru iegūst no “Crocus sativus”?",
          "answers": [
            "Salvija",
            "Safrāns",
            "Kapers",
            "Estragons",
          ],
          "correctAnswer": "Safrāns"
        },
        {
          "question":
              "Cik enciklopēdijas par krokusiem ir sarakstījis pasaulē lielākās krokusu sugas kolekcijas īpašnieks Jānis Rukšāns?",
          "answers": [
            "nevienu",
            "1",
            "2",
            "3",
          ],
          "correctAnswer": "2"
        },
        {
          "question":
              "Kuras neārstējamās slimības simptomu uzlabošanas nolūkos tiek klīniskos pētījumos testēta safrāna efektivitāte?",
          "answers": [
            "Alcheimera slimība",
            "Multiplā skleroze",
            "Muskuļu distrofija",
            "Hantingtona slimība",
          ],
          "correctAnswer": "Alcheimera slimība"
        },
        {
          "question":
              "Alatau krokuss ir viens no retākajiem pasaulē, kādā krāsā tas zied?",
          "answers": [
            "Violetā",
            "Zilā",
            "Tumši sarkanbrūnā",
            "Rozā",
          ],
          "correctAnswer": "Rozā"
        },
      ]
    },
    "en": {
      "plantName": "Krokuss",
      "questions": [
        {
          "question":
              "Kurā vēstures laikmetā krokusi tika pirmo reizi ievēroti?",
          "answers": ["Akmens laikmetā", "Bronzas laikmetā", "Dzels laikmetā"],
          "correctAnswer": "Bronzas laikmetā"
        },
        {
          "question": "Pie kuras puķu dzimtas pieder krokusi?",
          "answers": [
            "Īrisu dzimtas",
            "Rožu dzimtas",
            "Neļķu dzimtas",
            "Amariļļu dzimtas",
          ],
          "correctAnswer": "Īrisu dzimtas"
        },
        {
          "question":
              "Kā sauc pasaulē dārgāko garšvielu, kuru iegūst no “Crocus sativus”?",
          "answers": [
            "Salvija",
            "Safrāns",
            "Kapers",
            "Estragons",
          ],
          "correctAnswer": "Safrāns"
        },
        {
          "question":
              "Cik enciklopēdijas par krokusiem ir sarakstījis pasaulē lielākās krokusu sugas kolekcijas īpašnieks Jānis Rukšāns?",
          "answers": [
            "nevienu",
            "1",
            "2",
            "3",
          ],
          "correctAnswer": "2"
        },
        {
          "question":
              "Kuras neārstējamās slimības simptomu uzlabošanas nolūkos tiek klīniskos pētījumos testēta safrāna efektivitāte?",
          "answers": [
            "Alcheimera slimība",
            "Multiplā skleroze",
            "Muskuļu distrofija",
            "Hantingtona slimība",
          ],
          "correctAnswer": "Alcheimera slimība"
        },
        {
          "question":
              "Alatau krokuss ir viens no retākajiem pasaulē, kādā krāsā tas zied?",
          "answers": [
            "Violetā",
            "Zilā",
            "Tumši sarkanbrūnā",
            "Rozā",
          ],
          "correctAnswer": "Rozā"
        },
      ]
    },
    "de": {
      "plantName": "Krokuss",
      "questions": [
        {
          "question":
              "Kurā vēstures laikmetā krokusi tika pirmo reizi ievēroti?",
          "answers": ["Akmens laikmetā", "Bronzas laikmetā", "Dzels laikmetā"],
          "correctAnswer": "Bronzas laikmetā"
        },
        {
          "question": "Pie kuras puķu dzimtas pieder krokusi?",
          "answers": [
            "Īrisu dzimtas",
            "Rožu dzimtas",
            "Neļķu dzimtas",
            "Amariļļu dzimtas",
          ],
          "correctAnswer": "Īrisu dzimtas"
        },
        {
          "question":
              "Kā sauc pasaulē dārgāko garšvielu, kuru iegūst no “Crocus sativus”?",
          "answers": [
            "Salvija",
            "Safrāns",
            "Kapers",
            "Estragons",
          ],
          "correctAnswer": "Safrāns"
        },
        {
          "question":
              "Cik enciklopēdijas par krokusiem ir sarakstījis pasaulē lielākās krokusu sugas kolekcijas īpašnieks Jānis Rukšāns?",
          "answers": [
            "nevienu",
            "1",
            "2",
            "3",
          ],
          "correctAnswer": "2"
        },
        {
          "question":
              "Kuras neārstējamās slimības simptomu uzlabošanas nolūkos tiek klīniskos pētījumos testēta safrāna efektivitāte?",
          "answers": [
            "Alcheimera slimība",
            "Multiplā skleroze",
            "Muskuļu distrofija",
            "Hantingtona slimība",
          ],
          "correctAnswer": "Alcheimera slimība"
        },
        {
          "question":
              "Alatau krokuss ir viens no retākajiem pasaulē, kādā krāsā tas zied?",
          "answers": [
            "Violetā",
            "Zilā",
            "Tumši sarkanbrūnā",
            "Rozā",
          ],
          "correctAnswer": "Rozā"
        },
      ]
    },
    "ru": {
      "plantName": "Krokuss",
      "questions": [
        {
          "question":
              "Kurā vēstures laikmetā krokusi tika pirmo reizi ievēroti?",
          "answers": ["Akmens laikmetā", "Bronzas laikmetā", "Dzels laikmetā"],
          "correctAnswer": "Bronzas laikmetā"
        },
        {
          "question": "Pie kuras puķu dzimtas pieder krokusi?",
          "answers": [
            "Īrisu dzimtas",
            "Rožu dzimtas",
            "Neļķu dzimtas",
            "Amariļļu dzimtas",
          ],
          "correctAnswer": "Īrisu dzimtas"
        },
        {
          "question":
              "Kā sauc pasaulē dārgāko garšvielu, kuru iegūst no “Crocus sativus”?",
          "answers": [
            "Salvija",
            "Safrāns",
            "Kapers",
            "Estragons",
          ],
          "correctAnswer": "Safrāns"
        },
        {
          "question":
              "Cik enciklopēdijas par krokusiem ir sarakstījis pasaulē lielākās krokusu sugas kolekcijas īpašnieks Jānis Rukšāns?",
          "answers": [
            "nevienu",
            "1",
            "2",
            "3",
          ],
          "correctAnswer": "2"
        },
        {
          "question":
              "Kuras neārstējamās slimības simptomu uzlabošanas nolūkos tiek klīniskos pētījumos testēta safrāna efektivitāte?",
          "answers": [
            "Alcheimera slimība",
            "Multiplā skleroze",
            "Muskuļu distrofija",
            "Hantingtona slimība",
          ],
          "correctAnswer": "Alcheimera slimība"
        },
        {
          "question":
              "Alatau krokuss ir viens no retākajiem pasaulē, kādā krāsā tas zied?",
          "answers": [
            "Violetā",
            "Zilā",
            "Tumši sarkanbrūnā",
            "Rozā",
          ],
          "correctAnswer": "Rozā"
        },
      ]
    },
  },
  {
    "monthId": 4,
    "lv": {
      "plantName": "Āra bērzs",
      "questions": [
        {
          "question": "Kāds ir āra bērza latīniskais nosaukums?",
          "answers": [
            "Betula pubescencs Ehrh.",
            "Betula pendula Roth",
            "Betula utilis",
            "Betula humilis",
          ],
          "correctAnswer": "Betula pendula Roth"
        },
        {
          "question": "Vai bērzu sulu var izmantot pārtikas gatavošanā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kurā valstī ir visvairāk bērzu?",
          "answers": [
            "Latvijā",
            "Argentīnā",
            "Somijā",
            "Krievijā",
          ],
          "correctAnswer": "Krievijā"
        },
        {
          "question":
              "Kuru sastāvdaļu sejas kopšanas līdzekļos aizstāj ar bērzu sulu balstoties uz in vitro pētījuma rezultātiem?",
          "answers": [
            "Ūdeni",
            "Glikoskābi",
            "Triglicerīdus",
            "Glicerīnu",
          ],
          "correctAnswer": "Ūdeni"
        },
        {
          "question":
              "No kuras bērza daļas tiek iegūts tautas medicīnā lietotais betulīns?",
          "answers": [
            "No saknēm",
            "No lapām",
            "No tāss",
            "No smalkajiem zariem",
          ],
          "correctAnswer": "No tāss"
        },
        {
          "question": "Kurā zemes puslodē nav sastopami bērzi?",
          "answers": ["Dienvidu puslodē", "Ziemeļu puslodē"],
          "correctAnswer": "Dienvidu puslodē"
        },
      ]
    },
    "en": {
      "plantName": "Āra bērzs",
      "questions": [
        {
          "question": "Kāds ir āra bērza latīniskais nosaukums?",
          "answers": [
            "Betula pubescencs Ehrh.",
            "Betula pendula Roth",
            "Betula utilis",
            "Betula humilis",
          ],
          "correctAnswer": "Betula pendula Roth"
        },
        {
          "question": "Vai bērzu sulu var izmantot pārtikas gatavošanā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kurā valstī ir visvairāk bērzu?",
          "answers": [
            "Latvijā",
            "Argentīnā",
            "Somijā",
            "Krievijā",
          ],
          "correctAnswer": "Krievijā"
        },
        {
          "question":
              "Kuru sastāvdaļu sejas kopšanas līdzekļos aizstāj ar bērzu sulu balstoties uz in vitro pētījuma rezultātiem?",
          "answers": [
            "Ūdeni",
            "Glikoskābi",
            "Triglicerīdus",
            "Glicerīnu",
          ],
          "correctAnswer": "Ūdeni"
        },
        {
          "question":
              "No kuras bērza daļas tiek iegūts tautas medicīnā lietotais betulīns?",
          "answers": [
            "No saknēm",
            "No lapām",
            "No tāss",
            "No smalkajiem zariem",
          ],
          "correctAnswer": "No tāss"
        },
        {
          "question": "Kurā zemes puslodē nav sastopami bērzi?",
          "answers": ["Dienvidu puslodē", "Ziemeļu puslodē"],
          "correctAnswer": "Dienvidu puslodē"
        },
      ]
    },
    "de": {
      "plantName": "Āra bērzs",
      "questions": [
        {
          "question": "Kāds ir āra bērza latīniskais nosaukums?",
          "answers": [
            "Betula pubescencs Ehrh.",
            "Betula pendula Roth",
            "Betula utilis",
            "Betula humilis",
          ],
          "correctAnswer": "Betula pendula Roth"
        },
        {
          "question": "Vai bērzu sulu var izmantot pārtikas gatavošanā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kurā valstī ir visvairāk bērzu?",
          "answers": [
            "Latvijā",
            "Argentīnā",
            "Somijā",
            "Krievijā",
          ],
          "correctAnswer": "Krievijā"
        },
        {
          "question":
              "Kuru sastāvdaļu sejas kopšanas līdzekļos aizstāj ar bērzu sulu balstoties uz in vitro pētījuma rezultātiem?",
          "answers": [
            "Ūdeni",
            "Glikoskābi",
            "Triglicerīdus",
            "Glicerīnu",
          ],
          "correctAnswer": "Ūdeni"
        },
        {
          "question":
              "No kuras bērza daļas tiek iegūts tautas medicīnā lietotais betulīns?",
          "answers": [
            "No saknēm",
            "No lapām",
            "No tāss",
            "No smalkajiem zariem",
          ],
          "correctAnswer": "No tāss"
        },
        {
          "question": "Kurā zemes puslodē nav sastopami bērzi?",
          "answers": ["Dienvidu puslodē", "Ziemeļu puslodē"],
          "correctAnswer": "Dienvidu puslodē"
        },
      ]
    },
    "ru": {
      "plantName": "Āra bērzs",
      "questions": [
        {
          "question": "Kāds ir āra bērza latīniskais nosaukums?",
          "answers": [
            "Betula pubescencs Ehrh.",
            "Betula pendula Roth",
            "Betula utilis",
            "Betula humilis",
          ],
          "correctAnswer": "Betula pendula Roth"
        },
        {
          "question": "Vai bērzu sulu var izmantot pārtikas gatavošanā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kurā valstī ir visvairāk bērzu?",
          "answers": [
            "Latvijā",
            "Argentīnā",
            "Somijā",
            "Krievijā",
          ],
          "correctAnswer": "Krievijā"
        },
        {
          "question":
              "Kuru sastāvdaļu sejas kopšanas līdzekļos aizstāj ar bērzu sulu balstoties uz in vitro pētījuma rezultātiem?",
          "answers": [
            "Ūdeni",
            "Glikoskābi",
            "Triglicerīdus",
            "Glicerīnu",
          ],
          "correctAnswer": "Ūdeni"
        },
        {
          "question":
              "No kuras bērza daļas tiek iegūts tautas medicīnā lietotais betulīns?",
          "answers": [
            "No saknēm",
            "No lapām",
            "No tāss",
            "No smalkajiem zariem",
          ],
          "correctAnswer": "No tāss"
        },
        {
          "question": "Kurā zemes puslodē nav sastopami bērzi?",
          "answers": ["Dienvidu puslodē", "Ziemeļu puslodē"],
          "correctAnswer": "Dienvidu puslodē"
        },
      ]
    },
  },
  {
    "monthId": 5,
    "lv": {
      "plantName": "Ārstniecības pienene",
      "questions": [
        {
          "question": "Kāds ir ārstnieciskās pienenes latīniskais nosaukums?",
          "answers": [
            "Taraxacum officinale",
            "Taraxacum palustre",
            "Taraxacum erythrospermum",
            "Taraxacum laevigatum",
          ],
          "correctAnswer": "Taraxacum officinale"
        },
        {
          "question": "Kāda veida augs ir ārstnieciskā pienene?",
          "answers": [
            "Viengadīgs augs",
            "Divgadīgs augs",
            "Daudzgadīgs augs",
          ],
          "correctAnswer": "Daudzgadīgs augs"
        },
        {
          "question":
              "Pie kādas lakstaugu dzimtas pieder ārstnieciskā pienene?",
          "answers": [
            "Čemurziežu dzimtas",
            "Kurvjziežu dzimtas",
            "Krustziežu dzimtas",
            "Tauriņziežu dzimtas",
          ],
          "correctAnswer": "Kurvjziežu dzimtas"
        },
        {
          "question":
              "Kā sauc vielu, kuru satur visas ārstnieciskās pienenes auga daļas?",
          "answers": [
            "Šūnsula",
            "Pieneņu piens",
            "Piensula",
            "Emulsija",
            "Visi varianti ir pareizi"
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kurš no šiem ēdieniem vai dzērieniem nav patiess?",
          "answers": [
            "Fritēti pieneņu ziedi",
            "Grauzdēta pieneņu sakņu kafija",
            "Pieneņu vīns",
            "Citronu un pieneņu cepumi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question":
              "Cik sēklas spēj saražot viens ārstnieciskās pienenes augs?",
          "answers": [
            "400 sēklas",
            "1600 sēklas",
            "2000 sēklas",
            "3000 sēklas",
          ],
          "correctAnswer": "3000 sēklas"
        },
      ]
    },
    "en": {
      "plantName": "Ārstniecības pienene",
      "questions": [
        {
          "question": "Kāds ir ārstnieciskās pienenes latīniskais nosaukums?",
          "answers": [
            "Taraxacum officinale",
            "Taraxacum palustre",
            "Taraxacum erythrospermum",
            "Taraxacum laevigatum",
          ],
          "correctAnswer": "Taraxacum officinale"
        },
        {
          "question": "Kāda veida augs ir ārstnieciskā pienene?",
          "answers": [
            "Viengadīgs augs",
            "Divgadīgs augs",
            "Daudzgadīgs augs",
          ],
          "correctAnswer": "Daudzgadīgs augs"
        },
        {
          "question":
              "Pie kādas lakstaugu dzimtas pieder ārstnieciskā pienene?",
          "answers": [
            "Čemurziežu dzimtas",
            "Kurvjziežu dzimtas",
            "Krustziežu dzimtas",
            "Tauriņziežu dzimtas",
          ],
          "correctAnswer": "Kurvjziežu dzimtas"
        },
        {
          "question":
              "Kā sauc vielu, kuru satur visas ārstnieciskās pienenes auga daļas?",
          "answers": [
            "Šūnsula",
            "Pieneņu piens",
            "Piensula",
            "Emulsija",
            "Visi varianti ir pareizi"
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kurš no šiem ēdieniem vai dzērieniem nav patiess?",
          "answers": [
            "Fritēti pieneņu ziedi",
            "Grauzdēta pieneņu sakņu kafija",
            "Pieneņu vīns",
            "Citronu un pieneņu cepumi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question":
              "Cik sēklas spēj saražot viens ārstnieciskās pienenes augs?",
          "answers": [
            "400 sēklas",
            "1600 sēklas",
            "2000 sēklas",
            "3000 sēklas",
          ],
          "correctAnswer": "3000 sēklas"
        },
      ]
    },
    "de": {
      "plantName": "Ārstniecības pienene",
      "questions": [
        {
          "question": "Kāds ir ārstnieciskās pienenes latīniskais nosaukums?",
          "answers": [
            "Taraxacum officinale",
            "Taraxacum palustre",
            "Taraxacum erythrospermum",
            "Taraxacum laevigatum",
          ],
          "correctAnswer": "Taraxacum officinale"
        },
        {
          "question": "Kāda veida augs ir ārstnieciskā pienene?",
          "answers": [
            "Viengadīgs augs",
            "Divgadīgs augs",
            "Daudzgadīgs augs",
          ],
          "correctAnswer": "Daudzgadīgs augs"
        },
        {
          "question":
              "Pie kādas lakstaugu dzimtas pieder ārstnieciskā pienene?",
          "answers": [
            "Čemurziežu dzimtas",
            "Kurvjziežu dzimtas",
            "Krustziežu dzimtas",
            "Tauriņziežu dzimtas",
          ],
          "correctAnswer": "Kurvjziežu dzimtas"
        },
        {
          "question":
              "Kā sauc vielu, kuru satur visas ārstnieciskās pienenes auga daļas?",
          "answers": [
            "Šūnsula",
            "Pieneņu piens",
            "Piensula",
            "Emulsija",
            "Visi varianti ir pareizi"
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kurš no šiem ēdieniem vai dzērieniem nav patiess?",
          "answers": [
            "Fritēti pieneņu ziedi",
            "Grauzdēta pieneņu sakņu kafija",
            "Pieneņu vīns",
            "Citronu un pieneņu cepumi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question":
              "Cik sēklas spēj saražot viens ārstnieciskās pienenes augs?",
          "answers": [
            "400 sēklas",
            "1600 sēklas",
            "2000 sēklas",
            "3000 sēklas",
          ],
          "correctAnswer": "3000 sēklas"
        },
      ]
    },
    "ru": {
      "plantName": "Ārstniecības pienene",
      "questions": [
        {
          "question": "Kāds ir ārstnieciskās pienenes latīniskais nosaukums?",
          "answers": [
            "Taraxacum officinale",
            "Taraxacum palustre",
            "Taraxacum erythrospermum",
            "Taraxacum laevigatum",
          ],
          "correctAnswer": "Taraxacum officinale"
        },
        {
          "question": "Kāda veida augs ir ārstnieciskā pienene?",
          "answers": [
            "Viengadīgs augs",
            "Divgadīgs augs",
            "Daudzgadīgs augs",
          ],
          "correctAnswer": "Daudzgadīgs augs"
        },
        {
          "question":
              "Pie kādas lakstaugu dzimtas pieder ārstnieciskā pienene?",
          "answers": [
            "Čemurziežu dzimtas",
            "Kurvjziežu dzimtas",
            "Krustziežu dzimtas",
            "Tauriņziežu dzimtas",
          ],
          "correctAnswer": "Kurvjziežu dzimtas"
        },
        {
          "question":
              "Kā sauc vielu, kuru satur visas ārstnieciskās pienenes auga daļas?",
          "answers": [
            "Šūnsula",
            "Pieneņu piens",
            "Piensula",
            "Emulsija",
            "Visi varianti ir pareizi"
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kurš no šiem ēdieniem vai dzērieniem nav patiess?",
          "answers": [
            "Fritēti pieneņu ziedi",
            "Grauzdēta pieneņu sakņu kafija",
            "Pieneņu vīns",
            "Citronu un pieneņu cepumi",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question":
              "Cik sēklas spēj saražot viens ārstnieciskās pienenes augs?",
          "answers": [
            "400 sēklas",
            "1600 sēklas",
            "2000 sēklas",
            "3000 sēklas",
          ],
          "correctAnswer": "3000 sēklas"
        },
      ]
    },
  },
  {
    "monthId": 6,
    "lv": {
      "plantName": "Parastā pīpene",
      "questions": [
        {
          "question": "Kāds ir parastās pīpenes latīniskais nosaukums?",
          "answers": [
            "Leucanthemum vulgare",
            "Tanacetum parthenium",
            "Pyrethrum parthenium",
            "Tanacetum coccineum",
          ],
          "correctAnswer": "Leucanthemum vulgare"
        },
        {
          "question": "Kāds ir parastās pīpenes dabiskais areāls?",
          "answers": [
            "Eiropa, Krievija, Kaukāzs",
            "Eiropa, Ziemeļāfrika, Austrumāfrika",
            "Eiropa, Ziemeļāfrika, Rietumāfrika",
            "Dienvidamerika, Austrālija",
          ],
          "correctAnswer": "Eiropa, Krievija, Kaukāzs"
        },
        {
          "question":
              "Pie kuras kategorijas pieder parastās pīpene, ja to iedala pēc tās dzīvesformas?",
          "answers": [
            "Fanerofīts augs",
            "Hemikriptofīts augs",
            "Hamefīts",
            "Kriptofīts",
          ],
          "correctAnswer": "Hemikriptofīts augs"
        },
        {
          "question": "Kāda ir parastās pīpenes ziedēšanas stratēģija?",
          "answers": [
            "Sāk ar vīkala lapu atplaukšanu",
            "Stobrziedi atplaukst pirmie",
            "Pirmie atveras mēlziedi ārmalā ",
            "Pirmie sāk ziedēt mēlziedi centrā",
          ],
          "correctAnswer": "Pirmie atveras mēlziedi ārmalā "
        },
        {
          "question": "Ko veicina zieda plaukšanas stratēģija?",
          "answers": [
            "Zieda plaukšanas plašumu",
            "Zieda krāsu spilgtuma noturību",
            "Vitamīnu uzkrāšanās īpatsvaru ziedā",
            "Ziedēšanas laika paildzināšana"
          ],
          "correctAnswer": "Ziedēšanas laika paildzināšana"
        },
        {
          "question": "Vai parastajai pīpenei ir novērojama pašappute?",
          "answers": [
            "Nē",
            "Jā",
            "Reizēm",
          ],
          "correctAnswer": "Jā"
        },
      ]
    },
    "en": {
      "plantName": "Parastā pīpene",
      "questions": [
        {
          "question": "Kāds ir parastās pīpenes latīniskais nosaukums?",
          "answers": [
            "Leucanthemum vulgare",
            "Tanacetum parthenium",
            "Pyrethrum parthenium",
            "Tanacetum coccineum",
          ],
          "correctAnswer": "Leucanthemum vulgare"
        },
        {
          "question": "Kāds ir parastās pīpenes dabiskais areāls?",
          "answers": [
            "Eiropa, Krievija, Kaukāzs",
            "Eiropa, Ziemeļāfrika, Austrumāfrika",
            "Eiropa, Ziemeļāfrika, Rietumāfrika",
            "Dienvidamerika, Austrālija",
          ],
          "correctAnswer": "Eiropa, Krievija, Kaukāzs"
        },
        {
          "question":
              "Pie kuras kategorijas pieder parastās pīpene, ja to iedala pēc tās dzīvesformas?",
          "answers": [
            "Fanerofīts augs",
            "Hemikriptofīts augs",
            "Hamefīts",
            "Kriptofīts",
          ],
          "correctAnswer": "Hemikriptofīts augs"
        },
        {
          "question": "Kāda ir parastās pīpenes ziedēšanas stratēģija?",
          "answers": [
            "Sāk ar vīkala lapu atplaukšanu",
            "Stobrziedi atplaukst pirmie",
            "Pirmie atveras mēlziedi ārmalā ",
            "Pirmie sāk ziedēt mēlziedi centrā",
          ],
          "correctAnswer": "Pirmie atveras mēlziedi ārmalā "
        },
        {
          "question": "Ko veicina zieda plaukšanas stratēģija?",
          "answers": [
            "Zieda plaukšanas plašumu",
            "Zieda krāsu spilgtuma noturību",
            "Vitamīnu uzkrāšanās īpatsvaru ziedā",
            "Ziedēšanas laika paildzināšana"
          ],
          "correctAnswer": "Ziedēšanas laika paildzināšana"
        },
        {
          "question": "Vai parastajai pīpenei ir novērojama pašappute?",
          "answers": [
            "Nē",
            "Jā",
            "Reizēm",
          ],
          "correctAnswer": "Jā"
        },
      ]
    },
    "de": {
      "plantName": "Parastā pīpene",
      "questions": [
        {
          "question": "Kāds ir parastās pīpenes latīniskais nosaukums?",
          "answers": [
            "Leucanthemum vulgare",
            "Tanacetum parthenium",
            "Pyrethrum parthenium",
            "Tanacetum coccineum",
          ],
          "correctAnswer": "Leucanthemum vulgare"
        },
        {
          "question": "Kāds ir parastās pīpenes dabiskais areāls?",
          "answers": [
            "Eiropa, Krievija, Kaukāzs",
            "Eiropa, Ziemeļāfrika, Austrumāfrika",
            "Eiropa, Ziemeļāfrika, Rietumāfrika",
            "Dienvidamerika, Austrālija",
          ],
          "correctAnswer": "Eiropa, Krievija, Kaukāzs"
        },
        {
          "question":
              "Pie kuras kategorijas pieder parastās pīpene, ja to iedala pēc tās dzīvesformas?",
          "answers": [
            "Fanerofīts augs",
            "Hemikriptofīts augs",
            "Hamefīts",
            "Kriptofīts",
          ],
          "correctAnswer": "Hemikriptofīts augs"
        },
        {
          "question": "Kāda ir parastās pīpenes ziedēšanas stratēģija?",
          "answers": [
            "Sāk ar vīkala lapu atplaukšanu",
            "Stobrziedi atplaukst pirmie",
            "Pirmie atveras mēlziedi ārmalā ",
            "Pirmie sāk ziedēt mēlziedi centrā",
          ],
          "correctAnswer": "Pirmie atveras mēlziedi ārmalā "
        },
        {
          "question": "Ko veicina zieda plaukšanas stratēģija?",
          "answers": [
            "Zieda plaukšanas plašumu",
            "Zieda krāsu spilgtuma noturību",
            "Vitamīnu uzkrāšanās īpatsvaru ziedā",
            "Ziedēšanas laika paildzināšana"
          ],
          "correctAnswer": "Ziedēšanas laika paildzināšana"
        },
        {
          "question": "Vai parastajai pīpenei ir novērojama pašappute?",
          "answers": [
            "Nē",
            "Jā",
            "Reizēm",
          ],
          "correctAnswer": "Jā"
        },
      ]
    },
    "ru": {
      "plantName": "Parastā pīpene",
      "questions": [
        {
          "question": "Kāds ir parastās pīpenes latīniskais nosaukums?",
          "answers": [
            "Leucanthemum vulgare",
            "Tanacetum parthenium",
            "Pyrethrum parthenium",
            "Tanacetum coccineum",
          ],
          "correctAnswer": "Leucanthemum vulgare"
        },
        {
          "question": "Kāds ir parastās pīpenes dabiskais areāls?",
          "answers": [
            "Eiropa, Krievija, Kaukāzs",
            "Eiropa, Ziemeļāfrika, Austrumāfrika",
            "Eiropa, Ziemeļāfrika, Rietumāfrika",
            "Dienvidamerika, Austrālija",
          ],
          "correctAnswer": "Eiropa, Krievija, Kaukāzs"
        },
        {
          "question":
              "Pie kuras kategorijas pieder parastās pīpene, ja to iedala pēc tās dzīvesformas?",
          "answers": [
            "Fanerofīts augs",
            "Hemikriptofīts augs",
            "Hamefīts",
            "Kriptofīts",
          ],
          "correctAnswer": "Hemikriptofīts augs"
        },
        {
          "question": "Kāda ir parastās pīpenes ziedēšanas stratēģija?",
          "answers": [
            "Sāk ar vīkala lapu atplaukšanu",
            "Stobrziedi atplaukst pirmie",
            "Pirmie atveras mēlziedi ārmalā ",
            "Pirmie sāk ziedēt mēlziedi centrā",
          ],
          "correctAnswer": "Pirmie atveras mēlziedi ārmalā "
        },
        {
          "question": "Ko veicina zieda plaukšanas stratēģija?",
          "answers": [
            "Zieda plaukšanas plašumu",
            "Zieda krāsu spilgtuma noturību",
            "Vitamīnu uzkrāšanās īpatsvaru ziedā",
            "Ziedēšanas laika paildzināšana"
          ],
          "correctAnswer": "Ziedēšanas laika paildzināšana"
        },
        {
          "question": "Vai parastajai pīpenei ir novērojama pašappute?",
          "answers": [
            "Nē",
            "Jā",
            "Reizēm",
          ],
          "correctAnswer": "Jā"
        },
      ]
    },
  },
  {
    "monthId": 7,
    "lv": {
      "plantName": "Meža Avene",
      "questions": [
        {
          "question": "Meža avenes latīniskais nosaukums",
          "answers": [
            "Rubus idaeus",
            "Rubus armeniacus",
            "Ribes uva-crispa",
            "Rubus occidentalis"
          ],
          "correctAnswer": "Rubus idaeus"
        },
        {
          "question": "Kuros mēnešos Latvijā ir pieejamas vietējās avenes?",
          "answers": [
            "Maijs, jūnijs, jūlijs",
            "Jūnijs, jūlijs",
            "Jūlijs, augusts, septembris",
          ],
          "correctAnswer": ""
        },
        {
          "question":
              "Kāpēc avenes ir īpaši piemērotas ketogēnā uztura lietotājiem?",
          "answers": [
            "Tās satur maz ogļhidrātus",
            "Tām ir mazs kalorijas",
            "Satur daudz šķiedrvielu",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kādu vitamīnu avenes satur visvairāk?",
          "answers": [
            "A vitamīnu",
            "K vitamīnu",
            "C vitamīnu",
            "E vitamīnu",
          ],
          "correctAnswer": "C vitamīnu"
        },
        {
          "question": "No kura reģiona pasaulē ir cēlušās avenes?",
          "answers": [
            "Spānija",
            "Maljorka",
            "Turcija",
            "Indija",
          ],
          "correctAnswer": "Turcija"
        },
        {
          "question": "Vai aveņu tirdzniecība ir komerciāli izdevīga?",
          "answers": [
            "Jā, ja ir zināšanas nozarē",
            "Jā",
            "Reti",
            "Nē",
          ],
          "correctAnswer": "Jā, ja ir zināšanas nozarē"
        },
      ]
    },
    "en": {
      "plantName": "Meža Avene",
      "questions": [
        {
          "question": "Meža avenes latīniskais nosaukums",
          "answers": [
            "Rubus idaeus",
            "Rubus armeniacus",
            "Ribes uva-crispa",
            "Rubus occidentalis"
          ],
          "correctAnswer": "Rubus idaeus"
        },
        {
          "question": "Kuros mēnešos Latvijā ir pieejamas vietējās avenes?",
          "answers": [
            "Maijs, jūnijs, jūlijs",
            "Jūnijs, jūlijs",
            "Jūlijs, augusts, septembris",
          ],
          "correctAnswer": ""
        },
        {
          "question":
              "Kāpēc avenes ir īpaši piemērotas ketogēnā uztura lietotājiem?",
          "answers": [
            "Tās satur maz ogļhidrātus",
            "Tām ir mazs kalorijas",
            "Satur daudz šķiedrvielu",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kādu vitamīnu avenes satur visvairāk?",
          "answers": [
            "A vitamīnu",
            "K vitamīnu",
            "C vitamīnu",
            "E vitamīnu",
          ],
          "correctAnswer": "C vitamīnu"
        },
        {
          "question": "No kura reģiona pasaulē ir cēlušās avenes?",
          "answers": [
            "Spānija",
            "Maljorka",
            "Turcija",
            "Indija",
          ],
          "correctAnswer": "Turcija"
        },
        {
          "question": "Vai aveņu tirdzniecība ir komerciāli izdevīga?",
          "answers": [
            "Jā, ja ir zināšanas nozarē",
            "Jā",
            "Reti",
            "Nē",
          ],
          "correctAnswer": "Jā, ja ir zināšanas nozarē"
        },
      ]
    },
    "de": {
      "plantName": "Meža Avene",
      "questions": [
        {
          "question": "Meža avenes latīniskais nosaukums",
          "answers": [
            "Rubus idaeus",
            "Rubus armeniacus",
            "Ribes uva-crispa",
            "Rubus occidentalis"
          ],
          "correctAnswer": "Rubus idaeus"
        },
        {
          "question": "Kuros mēnešos Latvijā ir pieejamas vietējās avenes?",
          "answers": [
            "Maijs, jūnijs, jūlijs",
            "Jūnijs, jūlijs",
            "Jūlijs, augusts, septembris",
          ],
          "correctAnswer": ""
        },
        {
          "question":
              "Kāpēc avenes ir īpaši piemērotas ketogēnā uztura lietotājiem?",
          "answers": [
            "Tās satur maz ogļhidrātus",
            "Tām ir mazs kalorijas",
            "Satur daudz šķiedrvielu",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kādu vitamīnu avenes satur visvairāk?",
          "answers": [
            "A vitamīnu",
            "K vitamīnu",
            "C vitamīnu",
            "E vitamīnu",
          ],
          "correctAnswer": "C vitamīnu"
        },
        {
          "question": "No kura reģiona pasaulē ir cēlušās avenes?",
          "answers": [
            "Spānija",
            "Maljorka",
            "Turcija",
            "Indija",
          ],
          "correctAnswer": "Turcija"
        },
        {
          "question": "Vai aveņu tirdzniecība ir komerciāli izdevīga?",
          "answers": [
            "Jā, ja ir zināšanas nozarē",
            "Jā",
            "Reti",
            "Nē",
          ],
          "correctAnswer": "Jā, ja ir zināšanas nozarē"
        },
      ]
    },
    "ru": {
      "plantName": "Meža Avene",
      "questions": [
        {
          "question": "Meža avenes latīniskais nosaukums",
          "answers": [
            "Rubus idaeus",
            "Rubus armeniacus",
            "Ribes uva-crispa",
            "Rubus occidentalis"
          ],
          "correctAnswer": "Rubus idaeus"
        },
        {
          "question": "Kuros mēnešos Latvijā ir pieejamas vietējās avenes?",
          "answers": [
            "Maijs, jūnijs, jūlijs",
            "Jūnijs, jūlijs",
            "Jūlijs, augusts, septembris",
          ],
          "correctAnswer": ""
        },
        {
          "question":
              "Kāpēc avenes ir īpaši piemērotas ketogēnā uztura lietotājiem?",
          "answers": [
            "Tās satur maz ogļhidrātus",
            "Tām ir mazs kalorijas",
            "Satur daudz šķiedrvielu",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
        {
          "question": "Kādu vitamīnu avenes satur visvairāk?",
          "answers": [
            "A vitamīnu",
            "K vitamīnu",
            "C vitamīnu",
            "E vitamīnu",
          ],
          "correctAnswer": "C vitamīnu"
        },
        {
          "question": "No kura reģiona pasaulē ir cēlušās avenes?",
          "answers": [
            "Spānija",
            "Maljorka",
            "Turcija",
            "Indija",
          ],
          "correctAnswer": "Turcija"
        },
        {
          "question": "Vai aveņu tirdzniecība ir komerciāli izdevīga?",
          "answers": [
            "Jā, ja ir zināšanas nozarē",
            "Jā",
            "Reti",
            "Nē",
          ],
          "correctAnswer": "Jā, ja ir zināšanas nozarē"
        },
      ]
    },
  },
  {
    "monthId": 8,
    "lv": {
      "plantName": "Sila virsis",
      "questions": [
        {
          "question": "Vai sila virsis ir mūžzaļš krūms?",
          "answers": ["Jā", "Nē", "Nav krūms"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kur sila virsis ir visbiežāk sastopams?",
          "answers": [
            "Smiltājos",
            "Priežu silos",
            "Izcirtumos",
            "Sausos krūmājos",
            "Visas atbildes ir pareizas",
            "Neviena atbilde nav pareiza",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Pie kuras ziedaugu dzimtas pieder sila virsis?",
          "answers": [
            "Ciprešu dzimtas",
            "Ēriku dzimtas",
            "Graudzāļu dzimtas",
            "Naktssveču dzimtas",
          ],
          "correctAnswer": "Ēriku dzimtas"
        },
        {
          "question": "Kad zied mūžzaļais sila virsis?",
          "answers": [
            "Aprīlī, maijā",
            "Maijā, jūnijā",
            "Jūlijā, augustā",
            "Jūlijā, augustā, septembrī ",
          ],
          "correctAnswer": "Jūlijā, augustā, septembrī "
        },
        {
          "question": "Kādā krāsā reti zied sila virsis?",
          "answers": [
            "Sarkanā",
            "Tumši sarkanā",
            "Zilganā",
            "Baltā",
          ],
          "correctAnswer": "Baltā"
        },
        {
          "question": "Ar ko viršu medus ir īpašs?",
          "answers": [
            "Viegli rūgtena garša",
            "Tumša krāsa",
            "Biezs, želejveidīgs",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
      ]
    },
    "en": {
      "plantName": "Sila virsis",
      "questions": [
        {
          "question": "Vai sila virsis ir mūžzaļš krūms?",
          "answers": ["Jā", "Nē", "Nav krūms"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kur sila virsis ir visbiežāk sastopams?",
          "answers": [
            "Smiltājos",
            "Priežu silos",
            "Izcirtumos",
            "Sausos krūmājos",
            "Visas atbildes ir pareizas",
            "Neviena atbilde nav pareiza",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Pie kuras ziedaugu dzimtas pieder sila virsis?",
          "answers": [
            "Ciprešu dzimtas",
            "Ēriku dzimtas",
            "Graudzāļu dzimtas",
            "Naktssveču dzimtas",
          ],
          "correctAnswer": "Ēriku dzimtas"
        },
        {
          "question": "Kad zied mūžzaļais sila virsis?",
          "answers": [
            "Aprīlī, maijā",
            "Maijā, jūnijā",
            "Jūlijā, augustā",
            "Jūlijā, augustā, septembrī ",
          ],
          "correctAnswer": "Jūlijā, augustā, septembrī "
        },
        {
          "question": "Kādā krāsā reti zied sila virsis?",
          "answers": [
            "Sarkanā",
            "Tumši sarkanā",
            "Zilganā",
            "Baltā",
          ],
          "correctAnswer": "Baltā"
        },
        {
          "question": "Ar ko viršu medus ir īpašs?",
          "answers": [
            "Viegli rūgtena garša",
            "Tumša krāsa",
            "Biezs, želejveidīgs",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
      ]
    },
    "de": {
      "plantName": "Sila virsis",
      "questions": [
        {
          "question": "Vai sila virsis ir mūžzaļš krūms?",
          "answers": ["Jā", "Nē", "Nav krūms"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kur sila virsis ir visbiežāk sastopams?",
          "answers": [
            "Smiltājos",
            "Priežu silos",
            "Izcirtumos",
            "Sausos krūmājos",
            "Visas atbildes ir pareizas",
            "Neviena atbilde nav pareiza",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Pie kuras ziedaugu dzimtas pieder sila virsis?",
          "answers": [
            "Ciprešu dzimtas",
            "Ēriku dzimtas",
            "Graudzāļu dzimtas",
            "Naktssveču dzimtas",
          ],
          "correctAnswer": "Ēriku dzimtas"
        },
        {
          "question": "Kad zied mūžzaļais sila virsis?",
          "answers": [
            "Aprīlī, maijā",
            "Maijā, jūnijā",
            "Jūlijā, augustā",
            "Jūlijā, augustā, septembrī ",
          ],
          "correctAnswer": "Jūlijā, augustā, septembrī "
        },
        {
          "question": "Kādā krāsā reti zied sila virsis?",
          "answers": [
            "Sarkanā",
            "Tumši sarkanā",
            "Zilganā",
            "Baltā",
          ],
          "correctAnswer": "Baltā"
        },
        {
          "question": "Ar ko viršu medus ir īpašs?",
          "answers": [
            "Viegli rūgtena garša",
            "Tumša krāsa",
            "Biezs, želejveidīgs",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
      ]
    },
    "ru": {
      "plantName": "Sila virsis",
      "questions": [
        {
          "question": "Vai sila virsis ir mūžzaļš krūms?",
          "answers": ["Jā", "Nē", "Nav krūms"],
          "correctAnswer": "Jā"
        },
        {
          "question": "Kur sila virsis ir visbiežāk sastopams?",
          "answers": [
            "Smiltājos",
            "Priežu silos",
            "Izcirtumos",
            "Sausos krūmājos",
            "Visas atbildes ir pareizas",
            "Neviena atbilde nav pareiza",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Pie kuras ziedaugu dzimtas pieder sila virsis?",
          "answers": [
            "Ciprešu dzimtas",
            "Ēriku dzimtas",
            "Graudzāļu dzimtas",
            "Naktssveču dzimtas",
          ],
          "correctAnswer": "Ēriku dzimtas"
        },
        {
          "question": "Kad zied mūžzaļais sila virsis?",
          "answers": [
            "Aprīlī, maijā",
            "Maijā, jūnijā",
            "Jūlijā, augustā",
            "Jūlijā, augustā, septembrī ",
          ],
          "correctAnswer": "Jūlijā, augustā, septembrī "
        },
        {
          "question": "Kādā krāsā reti zied sila virsis?",
          "answers": [
            "Sarkanā",
            "Tumši sarkanā",
            "Zilganā",
            "Baltā",
          ],
          "correctAnswer": "Baltā"
        },
        {
          "question": "Ar ko viršu medus ir īpašs?",
          "answers": [
            "Viegli rūgtena garša",
            "Tumša krāsa",
            "Biezs, želejveidīgs",
            "Visi varianti ir pareizi",
          ],
          "correctAnswer": "Visi varianti ir pareizi"
        },
      ]
    },
  },
  {
    "monthId": 9,
    "lv": {
      "plantName": "Vasaras saulgrieze",
      "questions": [
        {
          "question": "Kāds ir vasaras saulgriezes nosaukums latīņu valodā?",
          "answers": [
            "Helianthus annuus",
            "Helianthus giganteus",
            "Helianthus paradoxus",
            "Helianthus pauciflorus",
          ],
          "correctAnswer": "Helianthus annuus"
        },
        {
          "question": "Cik gadīgs ir vasaras saulgriezes augs?",
          "answers": [
            "Daudzgadīgs",
            "Divgadīgs",
            "Viengadīgs",
          ],
          "correctAnswer": "Viengadīgs"
        },
        {
          "question":
              "Vasaras saulespuķes parasti aug no 1 līdz 3 metriem garumā. Cik gara ir pasaulē garākā saulespuķe?",
          "answers": [
            "4 metri",
            "5 metri",
            "7 metri",
            "9 metri",
          ],
          "correctAnswer": "9 metri"
        },
        {
          "question": "Kāda veida tropisms piemīt vasaras saulgriezei?",
          "answers": [
            "Pozitīvs tropisms",
            "Negatīvs tropisms",
            "Fototropisms",
            "Pozitīvs fototropisms",
            "Negatīvs fototropisms",
            "Heliotropisms",
            "Tigemotropisms"
          ],
          "correctAnswer": "Heliotropisms"
        },
        {
          "question":
              "Kādus pārtikas produktus var ražot no saulgriezēm – saulespuķēm?",
          "answers": [
            "Saulespuķu sēklas",
            "Saulespuķu sēklu sviests",
            "Saulespuķu sēklu sviests",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "en": {
      "plantName": "Vasaras saulgrieze",
      "questions": [
        {
          "question": "Kāds ir vasaras saulgriezes nosaukums latīņu valodā?",
          "answers": [
            "Helianthus annuus",
            "Helianthus giganteus",
            "Helianthus paradoxus",
            "Helianthus pauciflorus",
          ],
          "correctAnswer": "Helianthus annuus"
        },
        {
          "question": "Cik gadīgs ir vasaras saulgriezes augs?",
          "answers": [
            "Daudzgadīgs",
            "Divgadīgs",
            "Viengadīgs",
          ],
          "correctAnswer": "Viengadīgs"
        },
        {
          "question":
              "Vasaras saulespuķes parasti aug no 1 līdz 3 metriem garumā. Cik gara ir pasaulē garākā saulespuķe?",
          "answers": [
            "4 metri",
            "5 metri",
            "7 metri",
            "9 metri",
          ],
          "correctAnswer": "9 metri"
        },
        {
          "question": "Kāda veida tropisms piemīt vasaras saulgriezei?",
          "answers": [
            "Pozitīvs tropisms",
            "Negatīvs tropisms",
            "Fototropisms",
            "Pozitīvs fototropisms",
            "Negatīvs fototropisms",
            "Heliotropisms",
            "Tigemotropisms"
          ],
          "correctAnswer": "Heliotropisms"
        },
        {
          "question":
              "Kādus pārtikas produktus var ražot no saulgriezēm – saulespuķēm?",
          "answers": [
            "Saulespuķu sēklas",
            "Saulespuķu sēklu sviests",
            "Saulespuķu sēklu sviests",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "de": {
      "plantName": "Vasaras saulgrieze",
      "questions": [
        {
          "question": "Kāds ir vasaras saulgriezes nosaukums latīņu valodā?",
          "answers": [
            "Helianthus annuus",
            "Helianthus giganteus",
            "Helianthus paradoxus",
            "Helianthus pauciflorus",
          ],
          "correctAnswer": "Helianthus annuus"
        },
        {
          "question": "Cik gadīgs ir vasaras saulgriezes augs?",
          "answers": [
            "Daudzgadīgs",
            "Divgadīgs",
            "Viengadīgs",
          ],
          "correctAnswer": "Viengadīgs"
        },
        {
          "question":
              "Vasaras saulespuķes parasti aug no 1 līdz 3 metriem garumā. Cik gara ir pasaulē garākā saulespuķe?",
          "answers": [
            "4 metri",
            "5 metri",
            "7 metri",
            "9 metri",
          ],
          "correctAnswer": "9 metri"
        },
        {
          "question": "Kāda veida tropisms piemīt vasaras saulgriezei?",
          "answers": [
            "Pozitīvs tropisms",
            "Negatīvs tropisms",
            "Fototropisms",
            "Pozitīvs fototropisms",
            "Negatīvs fototropisms",
            "Heliotropisms",
            "Tigemotropisms"
          ],
          "correctAnswer": "Heliotropisms"
        },
        {
          "question":
              "Kādus pārtikas produktus var ražot no saulgriezēm – saulespuķēm?",
          "answers": [
            "Saulespuķu sēklas",
            "Saulespuķu sēklu sviests",
            "Saulespuķu sēklu sviests",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "ru": {
      "plantName": "Vasaras saulgrieze",
      "questions": [
        {
          "question": "Kāds ir vasaras saulgriezes nosaukums latīņu valodā?",
          "answers": [
            "Helianthus annuus",
            "Helianthus giganteus",
            "Helianthus paradoxus",
            "Helianthus pauciflorus",
          ],
          "correctAnswer": "Helianthus annuus"
        },
        {
          "question": "Cik gadīgs ir vasaras saulgriezes augs?",
          "answers": [
            "Daudzgadīgs",
            "Divgadīgs",
            "Viengadīgs",
          ],
          "correctAnswer": "Viengadīgs"
        },
        {
          "question":
              "Vasaras saulespuķes parasti aug no 1 līdz 3 metriem garumā. Cik gara ir pasaulē garākā saulespuķe?",
          "answers": [
            "4 metri",
            "5 metri",
            "7 metri",
            "9 metri",
          ],
          "correctAnswer": "9 metri"
        },
        {
          "question": "Kāda veida tropisms piemīt vasaras saulgriezei?",
          "answers": [
            "Pozitīvs tropisms",
            "Negatīvs tropisms",
            "Fototropisms",
            "Pozitīvs fototropisms",
            "Negatīvs fototropisms",
            "Heliotropisms",
            "Tigemotropisms"
          ],
          "correctAnswer": "Heliotropisms"
        },
        {
          "question":
              "Kādus pārtikas produktus var ražot no saulgriezēm – saulespuķēm?",
          "answers": [
            "Saulespuķu sēklas",
            "Saulespuķu sēklu sviests",
            "Saulespuķu sēklu sviests",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
  },
  {
    "monthId": 10,
    "lv": {
      "plantName": "Parastā kļava",
      "questions": [
        {
          "question": "Kāds ir parastās kļavas latīniskais nosaukums?",
          "answers": [
            "Acer",
            "Acer platanoides",
            "Acer palmatum",
            "Acer pseudoplatanus",
          ],
          "correctAnswer": "Acer platanoides"
        },
        {
          "question": "Kādas ir retāk sastopamās kļavu lapas?",
          "answers": [
            "Staraini trīsdaivainas un Staraini septiņdaivainas",
            "Staraini piecdaivainas",
            "Staraini deviņstarainas",
            "Staraini deviņstarainas un Staraini piecdaivainas",
          ],
          "correctAnswer": "Staraini trīsdaivainas un Staraini septiņdaivainas"
        },
        {
          "question": "Kādiem nolūkiem izmanto parastās kļavas koksni?",
          "answers": [
            "Mēbeļu ražošanai",
            "Grīdas segumiem",
            "Mūzikas instrumentiem",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question":
              "Kāpēc biežāk tiek izmantota parastās kļavas ārējā koksnes daļa - aplieva, nevis tās kodolkoksne?",
          "answers": [
            "Aplievas ir gaišās, gandrīz baltās krāsas dēļ",
            "Aplievai ir vieglāk piekļūt",
            "Aplievu vieglāk apstrādā",
            "Aplieva ir dārgāka, nekā kodolkoksne",
          ],
          "correctAnswer": "Aplievas ir gaišās, gandrīz baltās krāsas dēļ"
        },
      ]
    },
    "de": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā? DE",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    },
    "en": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    },
    "ru": {
      "plantName": "Parastā egle",
      "questions": [
        {
          "question": "Kāds ir parastās egles nosaukums latīņu valodā?",
          "answers": [
            "Picea mariana",
            "Picea breweriana",
            "Picea pungens",
            "Picea abies",
          ],
          "correctAnswer": "Picea abies"
        },
        {
          "question": "Vai parastā egle ir visizplatītākā koku suga Latvijā?",
          "answers": ["Jā", "Nē"],
          "correctAnswer": "Nē"
        },
        {
          "question":
              "Ja parasto egli nocērt un izmanto kā Ziemassvētku eglīti, cik ātri tā izžūs un pazaudēs skujas iekštelpās?",
          "answers": [
            "4 dienās",
            "5 dienās",
            "1-3 nedēļu laikā",
            "5 nedēļu laikā",
          ],
          "correctAnswer": "1-3 nedēļu laikā"
        },
        {
          "question":
              "Cik Dainu skapī ir dainas, kurās min egles mūžzaļo dabu?",
          "answers": [
            "1",
            "3",
            "8",
            "16",
          ],
          "correctAnswer": "16"
        },
        {
          "question": "Kāpēc parastā egle ir īpaši piemērota papīra ražošanai?",
          "answers": [
            "Koksnes gaišā krāsa",
            "Koka garuma dēļ",
            "Viegla skuju nošķiršana pārstrādes procesā",
            "Garas koka šķiedras",
          ],
          "correctAnswer": "Garas koka šķiedras"
        },
        {
          "question":
              "Kāpēc parastā egle kā izejmateriāls ir stīgu mūzikas instrumentu ražošanas etalons?",
          "answers": [
            "Lēts kokmateriāls",
            "Koksne ir blīva",
            "Koksne nav blīva, ir skanīga un elastīga",
            "Izmanto tradīciju dēļ",
          ],
          "correctAnswer": "Koksne nav blīva, ir skanīga un elastīga"
        },
      ]
    }
  },
  {
    "monthId": 11,
    "lv": {
      "plantName": "Šaurlapu lavanda",
      "questions": [
        {
          "question":
              "Kā latīņu valodā sauc visbiežāk audzēto angļu jeb šaurlapu lavandu?",
          "answers": [
            "Lavandula angustifolia",
            "Lavandula nimmoi",
            "Lavandula latifolia",
            "Lavandula Stoechas",
          ],
          "correctAnswer": ""
        },
        {
          "question": "Kāds augs ir lavanda pēc pielietojuma?",
          "answers": [
            "Pārtikas augs",
            "Ārstniecības augs",
            "Dekoratīvs augs",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Kādam nolūkam aromterapijā izmanto lavandas eļļu?",
          "answers": [
            "Garastāvokļa  uzmundrināšanai",
            "Stresa, trauksmes sajūtu mazināšanai",
            "Enerģijas līmeņa uzlabošanai",
            "Nav medicīniska nolūka, patīkams aromāts",
          ],
          "correctAnswer": "Stresa, trauksmes sajūtu mazināšanai"
        },
        {
          "question": "Kuru garšvielu gaļas marinādēs var aizstāt ar lavandu?",
          "answers": [
            "Rozmarīnu",
            "Timiānu",
            "Koriandru",
            "Lauru lapu",
          ],
          "correctAnswer": "Rozmarīnu"
        },
        {
          "question":
              "Kuru lavandas augam piemītošo īpašību dēļ, tas ir vērtīgs tradicionālajā medicīnā?",
          "answers": [
            "Antibakteriālās īpašības dēļ",
            "Antimikrobiālās rezistences dēļ",
            "Pretiekaisuma efekta dēļ",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "en": {
      "plantName": "Šaurlapu lavanda",
      "questions": [
        {
          "question":
              "Kā latīņu valodā sauc visbiežāk audzēto angļu jeb šaurlapu lavandu?",
          "answers": [
            "Lavandula angustifolia",
            "Lavandula nimmoi",
            "Lavandula latifolia",
            "Lavandula Stoechas",
          ],
          "correctAnswer": ""
        },
        {
          "question": "Kāds augs ir lavanda pēc pielietojuma?",
          "answers": [
            "Pārtikas augs",
            "Ārstniecības augs",
            "Dekoratīvs augs",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Kādam nolūkam aromterapijā izmanto lavandas eļļu?",
          "answers": [
            "Garastāvokļa  uzmundrināšanai",
            "Stresa, trauksmes sajūtu mazināšanai",
            "Enerģijas līmeņa uzlabošanai",
            "Nav medicīniska nolūka, patīkams aromāts",
          ],
          "correctAnswer": "Stresa, trauksmes sajūtu mazināšanai"
        },
        {
          "question": "Kuru garšvielu gaļas marinādēs var aizstāt ar lavandu?",
          "answers": [
            "Rozmarīnu",
            "Timiānu",
            "Koriandru",
            "Lauru lapu",
          ],
          "correctAnswer": "Rozmarīnu"
        },
        {
          "question":
              "Kuru lavandas augam piemītošo īpašību dēļ, tas ir vērtīgs tradicionālajā medicīnā?",
          "answers": [
            "Antibakteriālās īpašības dēļ",
            "Antimikrobiālās rezistences dēļ",
            "Pretiekaisuma efekta dēļ",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "de": {
      "plantName": "Šaurlapu lavanda",
      "questions": [
        {
          "question":
              "Kā latīņu valodā sauc visbiežāk audzēto angļu jeb šaurlapu lavandu?",
          "answers": [
            "Lavandula angustifolia",
            "Lavandula nimmoi",
            "Lavandula latifolia",
            "Lavandula Stoechas",
          ],
          "correctAnswer": ""
        },
        {
          "question": "Kāds augs ir lavanda pēc pielietojuma?",
          "answers": [
            "Pārtikas augs",
            "Ārstniecības augs",
            "Dekoratīvs augs",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Kādam nolūkam aromterapijā izmanto lavandas eļļu?",
          "answers": [
            "Garastāvokļa  uzmundrināšanai",
            "Stresa, trauksmes sajūtu mazināšanai",
            "Enerģijas līmeņa uzlabošanai",
            "Nav medicīniska nolūka, patīkams aromāts",
          ],
          "correctAnswer": "Stresa, trauksmes sajūtu mazināšanai"
        },
        {
          "question": "Kuru garšvielu gaļas marinādēs var aizstāt ar lavandu?",
          "answers": [
            "Rozmarīnu",
            "Timiānu",
            "Koriandru",
            "Lauru lapu",
          ],
          "correctAnswer": "Rozmarīnu"
        },
        {
          "question":
              "Kuru lavandas augam piemītošo īpašību dēļ, tas ir vērtīgs tradicionālajā medicīnā?",
          "answers": [
            "Antibakteriālās īpašības dēļ",
            "Antimikrobiālās rezistences dēļ",
            "Pretiekaisuma efekta dēļ",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
    "ru": {
      "plantName": "Šaurlapu lavanda",
      "questions": [
        {
          "question":
              "Kā latīņu valodā sauc visbiežāk audzēto angļu jeb šaurlapu lavandu?",
          "answers": [
            "Lavandula angustifolia",
            "Lavandula nimmoi",
            "Lavandula latifolia",
            "Lavandula Stoechas",
          ],
          "correctAnswer": ""
        },
        {
          "question": "Kāds augs ir lavanda pēc pielietojuma?",
          "answers": [
            "Pārtikas augs",
            "Ārstniecības augs",
            "Dekoratīvs augs",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question": "Kādam nolūkam aromterapijā izmanto lavandas eļļu?",
          "answers": [
            "Garastāvokļa  uzmundrināšanai",
            "Stresa, trauksmes sajūtu mazināšanai",
            "Enerģijas līmeņa uzlabošanai",
            "Nav medicīniska nolūka, patīkams aromāts",
          ],
          "correctAnswer": "Stresa, trauksmes sajūtu mazināšanai"
        },
        {
          "question": "Kuru garšvielu gaļas marinādēs var aizstāt ar lavandu?",
          "answers": [
            "Rozmarīnu",
            "Timiānu",
            "Koriandru",
            "Lauru lapu",
          ],
          "correctAnswer": "Rozmarīnu"
        },
        {
          "question":
              "Kuru lavandas augam piemītošo īpašību dēļ, tas ir vērtīgs tradicionālajā medicīnā?",
          "answers": [
            "Antibakteriālās īpašības dēļ",
            "Antimikrobiālās rezistences dēļ",
            "Pretiekaisuma efekta dēļ",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
      ]
    },
  },
  {
    "monthId": 12,
    "lv": {
      "plantName": "Puansetija",
      "questions": [
        {
          "question": "Kādos vēl vārdos tautā mēdz saukt puansetiju?",
          "answers": [
            "Ziemassvētku puķe",
            "Ziemassvētku zvaigzne",
            "Greznā eiforbija",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question":
              "Puansetija ir populārākais augs Ziemassvētku laikā. Tai par godu ir sava svētku diena. Kurā datumā ir puansetijas diena?",
          "answers": [
            "11. decembrī",
            "12. decembrī",
            "13. decembrī",
            "14. decembrī",
          ],
          "correctAnswer": "12. decembrī"
        },
        {
          "question":
              "Puansetija nav indīga ne cilvēkiem, ne dzīvniekiem, bet dažiem cilvēkiem tā var izraisīt…",
          "answers": [
            "Šķaudīšanas reakciju",
            "Acu asarošanu",
            "Ādas dermatītu",
          ],
          "correctAnswer": "Ādas dermatītu"
        },
        {
          "question": "Puansetijas spilgti sarkanā krāsa piemīt tās…?",
          "answers": [
            "Lapām",
            "Ziediem",
            "Lapām un ziediem",
          ],
          "correctAnswer": "Lapām"
        },
        {
          "question": "No kuras valsts ir cēlušās puansetijas?",
          "answers": [
            "No Spānijas",
            "No Portugāles",
            "No Argentīnas",
            "No Meksikas",
          ],
          "correctAnswer": "No Meksikas"
        },
        {
          "question": "Amerikā vispārdotākais augs puķupodā ir ?",
          "answers": [
            "Orhidejas",
            "Puansetijas",
          ],
          "correctAnswer": "Puansetijas"
        },
      ]
    },
    "en": {
      "plantName": "Puansetija",
      "questions": [
        {
          "question": "Kādos vēl vārdos tautā mēdz saukt puansetiju?",
          "answers": [
            "Ziemassvētku puķe",
            "Ziemassvētku zvaigzne",
            "Greznā eiforbija",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question":
              "Puansetija ir populārākais augs Ziemassvētku laikā. Tai par godu ir sava svētku diena. Kurā datumā ir puansetijas diena?",
          "answers": [
            "11. decembrī",
            "12. decembrī",
            "13. decembrī",
            "14. decembrī",
          ],
          "correctAnswer": "12. decembrī"
        },
        {
          "question":
              "Puansetija nav indīga ne cilvēkiem, ne dzīvniekiem, bet dažiem cilvēkiem tā var izraisīt…",
          "answers": [
            "Šķaudīšanas reakciju",
            "Acu asarošanu",
            "Ādas dermatītu",
          ],
          "correctAnswer": "Ādas dermatītu"
        },
        {
          "question": "Puansetijas spilgti sarkanā krāsa piemīt tās…?",
          "answers": [
            "Lapām",
            "Ziediem",
            "Lapām un ziediem",
          ],
          "correctAnswer": "Lapām"
        },
        {
          "question": "No kuras valsts ir cēlušās puansetijas?",
          "answers": [
            "No Spānijas",
            "No Portugāles",
            "No Argentīnas",
            "No Meksikas",
          ],
          "correctAnswer": "No Meksikas"
        },
        {
          "question": "Amerikā vispārdotākais augs puķupodā ir ?",
          "answers": [
            "Orhidejas",
            "Puansetijas",
          ],
          "correctAnswer": "Puansetijas"
        },
      ]
    },
    "de": {
      "plantName": "Puansetija",
      "questions": [
        {
          "question": "Kādos vēl vārdos tautā mēdz saukt puansetiju?",
          "answers": [
            "Ziemassvētku puķe",
            "Ziemassvētku zvaigzne",
            "Greznā eiforbija",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question":
              "Puansetija ir populārākais augs Ziemassvētku laikā. Tai par godu ir sava svētku diena. Kurā datumā ir puansetijas diena?",
          "answers": [
            "11. decembrī",
            "12. decembrī",
            "13. decembrī",
            "14. decembrī",
          ],
          "correctAnswer": "12. decembrī"
        },
        {
          "question":
              "Puansetija nav indīga ne cilvēkiem, ne dzīvniekiem, bet dažiem cilvēkiem tā var izraisīt…",
          "answers": [
            "Šķaudīšanas reakciju",
            "Acu asarošanu",
            "Ādas dermatītu",
          ],
          "correctAnswer": "Ādas dermatītu"
        },
        {
          "question": "Puansetijas spilgti sarkanā krāsa piemīt tās…?",
          "answers": [
            "Lapām",
            "Ziediem",
            "Lapām un ziediem",
          ],
          "correctAnswer": "Lapām"
        },
        {
          "question": "No kuras valsts ir cēlušās puansetijas?",
          "answers": [
            "No Spānijas",
            "No Portugāles",
            "No Argentīnas",
            "No Meksikas",
          ],
          "correctAnswer": "No Meksikas"
        },
        {
          "question": "Amerikā vispārdotākais augs puķupodā ir ?",
          "answers": [
            "Orhidejas",
            "Puansetijas",
          ],
          "correctAnswer": "Puansetijas"
        },
      ]
    },
    "ru": {
      "plantName": "Puansetija",
      "questions": [
        {
          "question": "Kādos vēl vārdos tautā mēdz saukt puansetiju?",
          "answers": [
            "Ziemassvētku puķe",
            "Ziemassvētku zvaigzne",
            "Greznā eiforbija",
            "Visas atbildes ir pareizas",
          ],
          "correctAnswer": "Visas atbildes ir pareizas"
        },
        {
          "question":
              "Puansetija ir populārākais augs Ziemassvētku laikā. Tai par godu ir sava svētku diena. Kurā datumā ir puansetijas diena?",
          "answers": [
            "11. decembrī",
            "12. decembrī",
            "13. decembrī",
            "14. decembrī",
          ],
          "correctAnswer": "12. decembrī"
        },
        {
          "question":
              "Puansetija nav indīga ne cilvēkiem, ne dzīvniekiem, bet dažiem cilvēkiem tā var izraisīt…",
          "answers": [
            "Šķaudīšanas reakciju",
            "Acu asarošanu",
            "Ādas dermatītu",
          ],
          "correctAnswer": "Ādas dermatītu"
        },
        {
          "question": "Puansetijas spilgti sarkanā krāsa piemīt tās…?",
          "answers": [
            "Lapām",
            "Ziediem",
            "Lapām un ziediem",
          ],
          "correctAnswer": "Lapām"
        },
        {
          "question": "No kuras valsts ir cēlušās puansetijas?",
          "answers": [
            "No Spānijas",
            "No Portugāles",
            "No Argentīnas",
            "No Meksikas",
          ],
          "correctAnswer": "No Meksikas"
        },
        {
          "question": "Amerikā vispārdotākais augs puķupodā ir ?",
          "answers": [
            "Orhidejas",
            "Puansetijas",
          ],
          "correctAnswer": "Puansetijas"
        },
      ]
    },
  },
];

var sourcesList = [
  [
    "Aguraiuja u. c. 1991",
    "Aguraiuja, R., Tome, M., Pots, E. Bioloģija. Botānika 6.–7. klasei. Red. V. Māzings; tulk. Z. Sprīvulis. Rīga: Zvaigzne, 1991."
  ],
  [
    "Aizpure 2000",
    "Aizpure, A. Bioloģija. Botānika 7. klasei: eksper. māc. grām. Rīga: Zvaigzne ABC, 2000."
  ],
  [
    "Aizpure 2008",
    "Aizpure, A. Bioloģija. Botānika 7. klasei : māc. grām. Rīga: Zvaigzne ABC, 2008."
  ],
  [
    "BW 2000",
    "Schubert, R., Wagner, G. Botanisches Wörterbuch. 12. Aufl. Stuttgart: Eugen Ulmer, 2000."
  ],
  [
    "Dolacis 1998",
    "Dolacis, J. Mežtehnikas, mežsaimniecības un kokrūpniecības terminu vārdnīca. Rīga: Antēra, 1998."
  ],
  [
    "Dornseiff 2004",
    "Dornseiff, F. Der deutsche Wortschatz nach Sachgruppen. 8. völlig neu bearb. Aufl. von Uwe Quasthoff. Berlin; New York: de Gruyter, 2004."
  ],
  [
    "ELSEV 2002",
    "Macura, P. Russian-English Elsevier's Dictionary of Botany. 2nd revised edition. Amsterdam etc.: Elsevier Science, 2002."
  ],
  [
    "GalBV 1950",
    "Galenieks, P. Botaniskā vārdnīca. Rīga: Latvijas Valsts izdevniecība, 1950."
  ],
  [
    "Galenieks 1945",
    "Galenieks, P. Botanika: ar 144 zīmējumiem tekstā. 5. izd. Rīga: Zinātnisko rakstu apgāds, 1945."
  ],
  [
    "HandbF 2015",
    "Haake, K.-M. Handbuch der Floristik, 2.überarb. Aufl. Ratingen: BLOOM'S GmbH, 2015."
  ],
  [
    "Langenfelds u. c. 1973",
    "Langenfelds, V., Ozoliņa, E., Ābele, G. Augstāko augu sistemātika. Rīga: Zvaigzne, 1973."
  ],
  [
    "LD6 1998",
    "Latvijas daba. 6. sēj. Atb. red. G. Kavacs. Rīga: Preses nams, 1998."
  ],
  [
    "LVAN 2003",
    "Ēdelmane, I., Ozola, Ā. Latviešu valodas augu nosaukumi. Rīga: Augsburgas Institūts, 2003."
  ],
  [
    "MNT 2007",
    "Meža nozares termini: Eiropas Savienības un citos starptautiskos tiesību aktos lietoto meža nozares terminu vārdnīca. Angļu-latviešu-angļu / Forest sector terminology. Glossary of forest sector terminology used in the European Union and other international legislation. English-Latvian-English. Rīga: Tulkošanas un terminoloģijas centrs: Madris, 2007."
  ],
  [
    "Nagle, Gribuste 2000",
    "Nagle, Ē., Gribuste, R. Bioloģija 7. klasei. 1. izd. Lielvārde: Lielvārds, 2000."
  ],
  ["PDE 2007", "Kavacs, G. Populārā dabas enciklopēdija. Rīga: Jumava, 2007."],
  [
    "Piterāns u. c. 1975",
    "Piterāns, A., Vimba, E., Vulfa, L. Zemāko augu sistemātika. Rīga: Zvaigzne, 1975."
  ],
  [
    "Priedītis 2009",
    "Priedītis, N. Augu ģeogrāfija un daudzveidība. Rīga: Zvaigzne ABC, 2009."
  ],
  [
    "Seybold 2005",
    "Seybold, S. Die wissenschaftlichen Namen der Pflanzen und was sie bedeuten. 2. korr. Aufl. Stuttgart: Eugen Ulmer Verlag, 2005."
  ],
  ["SV 1996", "Svešvārdu vārdnīca. Red. D. Guļevska. Rīga: Norden, 1996."],
  [
    "SV 1999",
    "Baldunčiks, J., Pokrotniece, K. Svešvārdu vārdnīca. Rīga: Jumava, 1999."
  ],
  [
    "Tabaka 2001",
    "Tabaka, L. Latvijas flora un veģetācija : Zemgales ģeobotāniskais rajons. Rīga: Latvijas Universitāte, 2001."
  ],
  [
    "Term3 1960",
    "Augu aizsardzība: zinātniskā un tehniskā terminoloģija. Red. J. Saveļjeva, M. Zumberga. Rīga: LPSR ZA izdevniecība, 1960."
  ],
  [
    "Term9 1973",
    "Agronomijas terminu vārdnīca. Sast. aut. kol. K. Bamberga vad. Rīga: Zinātne, 1973."
  ],
  [
    "Term14 1981",
    "Ekonomiskās ģeogrāfijas terminu vārdnīca. Red. A. Andrejeva. Rīga: Galvenā enciklopēdiju redakcija, 1981."
  ],
  [
    "Welle 1994",
    "Welle, E. F. Kleines Repetitorium der Botanik. 10. Aufl. Koeln: [o. v.], 1994."
  ],
  [
    "Zander 2008",
    "Erhardt, W., Götz, E., Bödeker, N. u. a. Zander. Handwörterbuch der Pflanzennamen. 18. Aufl. Stuttgart: Eugen Ulmer, 2008."
  ],
  [
    "Zander 2014",
    "Erhardt, W., Götz, E., Bödeker, N. u. a. Zander: Handwörterbuch der Pflanzennamen, 19., akt. Aufl. Stuttgart: Eugen Ulmer Verlag, 2014."
  ],
  [
    "Балашев 1970",
    "Словарь полезных растений на двадцати европейских языках. Pед. Л. Л. Балашев. Москва: Наука, 1970."
  ],
  [
    "БЭС 1986",
    "Биологический энциклопедический словарь. Гл. ред. М. С. Гиляров, 2-е изд., испр. Москва: Сов. Энциклопедия, 1986."
  ],
  [
    "Давыдов 2013",
    "Давыдов, Н. Н. Ботанический словарь. Русско-английско-немецко-французско-латинский. Москва: Книга по Требованию, 2013."
  ],
  [
    "Киселевский 1967",
    "Латино-русско-белорусский ботанический словарь. A. И. Киселевский. Минск: Наука и техника, 1967."
  ],
  [
    "Меркулова 1967",
    "Меркулова, В. А. Очерки по русской народной номенклатуре растений. Москва: Наука, 1967."
  ],
  ["Славик 1982", "Славик, Б. Растения полей и лесов. Прага: Артия, 1982."],
];
var internetSourcesList = [
  ["Wacad", "https://dic.academic.ru/"],
  ["Wakadterm", "www.termini.lza.lv"],
  ["Wbeaplanet", "http://beaplanet.ru/"],
  ["Wbio", "http://www.biology-online.org/dictionary/Main_Page"],
  ["Wbioege", "http://bioege.edu.ru/botany.html"],
  ["Wbot", "http://botanika.su/"],
  ["Wbot 1984", "http://www.cnshb.ru/AKDiL/0017/default.shtm"],
  ["Wcol", "https://www.collinsdictionary.com/dictionary/english"],
  ["Wdic", "http://www.dictionary.com/"],
  ["Wduden", "www.duden.de"],
  ["Wenc", "http://www.encyclopedia.com/"],
  ["Weurot", "www.eurotermbank.com "],
  ["Whimbio", "http://him-bio.ru/"],
  ["Wi", "https://en.wiktionary.org/wiki/Wiktionary:Main_Page"],
  ["Wkor", "https://www.korrekturen.de/wortliste/staengel.shtml"],
  ["Wld", "http://www.latvijasdaba.lv/"],
  ["Wlet", "https://www.letonika.lv/"],
  ["Wlevr", "http://www.online-lernen.levrai.de/index.htm"],
  ["Wmob", "http://www.mobot.org/mobot/latindict/introduction.shtml"],
  ["Woxfordlat", "https://lv.oxforddictionaries.com/"],
  ["Woxfordeng", "https://en.oxforddictionaries.com/"],
  ["Wrob", "http://www.robinsonlibrary.com/index.html"],
  ["Wtez", "www.tezaurs.lv"],
  ["Wtilde", "https://term.tilde.com/"],
  ["Wuzd", "www.uzdevumi.lv"],
];
