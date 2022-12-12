import 'package:flutter/material.dart';

const imagesBackgroundColor = Color(0xFFf0ec74);

var colorsByGroupType = {
  "ģints": Colors.green,
  "apakšģints": Colors.yellow,
  "suga": Colors.blue,
  "pasuga": Colors.purple,
  "varietāte": Colors.brown,
  "forma": Colors.red,
  "šķirnu grupa": Colors.pink
};

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
    "tips": [
      "Ja nevēlaties pavasarī iestrēgt dārza darbu ritenī, jau tagad var uzasināt darbarīkus un pārskatīt dārza inventāru - varbūt kāda lieta jānopērk, bet cita - jāsalabo.",
      "Ja siltumnīcas jumta slīpums ir nepietiekams (mazāk par 22 grādiem) zem lielas sniega nastas (it īpaši, ja sniegs ir slapjš) var sagāzties pati konstrukcija, tādēļ sniegs no siltumnīcas jumta regulāri jānotīra.",
      "Regulāri jāseko ražai pagrabā. Parasti tajā mēdz būt par siltu un par mitru. Baidoties no ziemas sala, mēs nereti piemirstam, ka dārzeņi un augļi uzglabāšanas laikā turpina elpot, tātad izdala siltumu un iztvaiko ūdeni. Pagrabs ir jāvēdina un jāpārbauda gaisa temperatūra.",
      "Mitrs, smags sniegs jānopurina no koku zariem, lai tie nelūztu. Tāpat svarīgi ap jaunu kociņu stumbriem piemīdīt sniegu, lai kavētu iespēju grauzējiem veidot ejas un apgrauzt koku mizu.",
      "Ja ir mēreni laikapstākļi un rudenī iekavēts - tad var kaļķot augļukokus. Bet šim darbam nav piemērots sala laiks. Darbam var izmantot gatavo maisījumu, ko pārdod dārza preču veikalos.  ",
      "Ja laika apstākļi ļauj un nav pārāk auksts, ir laiks izzāģēt kokus un izkopt krūmus. Paraugieties, kuri augļukoku zari ir sažuvuši - tie nelokās, bet viegli lūst. Ogulājiem izņem vecākos zarus un tos, kas aug cits citam pāri. ",
      "Kaut arī ziemā dārzā nav daudz darba, jāseko līdzi laikapstākļu maiņai. Ja ir maz sniega, bet apmēram nedēļu pieturas sals, zeme būs sasalusi apmēram 5 cm dziļumā. Tas kaitē ziemcietēm, graudzālēm, sīpolpuķēm, rozēm, kas ir jutīgākas par citām. Augiem uzber pie mājas stūra vai kaut kur citur saputinātu sniegu vai uzklāj egļu zarus.  ",
      "Ja sniega ir daudz, tas kaitē skujeņiem. Arī tad, ja tā nav pārāk daudz, bet sniegs ir mitrs un smags, jākrata nost, jo var deformēt augu formu. "
    ]
  },
  {
    "monthId": 2,
    "tips": [
      "Februārī pārlūko sēklu krājumus un gādā jaunas. Ja sēklas pērk lielveikalā, jābūt gana zinošam, jo pārdevēja, ar ko konsultēties, līdzās pie stenda nebūs. Toties ir iespēja katru paciņu apskatīt, izpētīt informāciju uz iepakojuma, salīdzināt dažādu firmu piedāvājumu, cenas. Svarīgi ņemt vērā, ka attēlā uz sēklu paciņas retāk norādīta šķirne, biežāk tās piederība kādai grupai (īsie vai garie gurķi, cilindrveida vai apaļās bietes).",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.1? Šķirnes raksturojumam - vai tā agrīna, vidēji agrīna, vēlīna; kādas ir ražas īpatnības - garša, augļu/sakņu lielums, ziedu, lapu krāsa.",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.2? Audzēšanas un kopšanas nosacījumiem - kad un kādā attālumā, cik dziļi sēklas ieteicams sēt, cik liels būs augu augums, pēc cik ilga laika gaidāma raža. ",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.3? Noteikti pārliecinieties par sēklu derīguma termiņu. Jo līdz paciņas atvēršanas pēdējam gadam norādīts ilgāks laiks, jo, protams, labāk. Ir sēklas, kas labu dīgtspēju saglabā arī ilgāk, bet, iegādājoties tādas, kam termiņš beigsies pavisam drīz vai pat pagājis (tāpēc var būt nocenotas), risks ir pircēja ziņā. ",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.4? Noderīga ir informācija, kur sēklas audzētas (nevis tikai safasētas paciņās!) un vai to izcelsmes vieta klimatisko apstākļu ziņā ir līdzīga Latvijai.",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.5? No vēsākās telpās ziemojušām puķēm, piemēram, fuksijām (Fuchsia spp.), krizantēmām (Chrysanthemum spp.) un pelargonijām (Pelargonium spp.) var griezt spraudeņus. Spraušanu vislabāk veikt mēneša beigās, kad gaismas apstākļi jau ir piemērotāki. ",
      "Kam pievērst uzmanību uz sēklu iepakojuma NR.6? Sēj puķes ar garu veģetācijas periodu. Tam piemērotas lobēlijas (Lobelia spp.), lauvmutītes (Antirrhinum spp.), verbēnas (Verbena spp.), lefkojas (Matthola incana), petūnijas (Petunia spp.), leduspuķes (Begonia semperflorens) un citas. Ja tās būs tikai pašu priekam, nevis stādu tirgošanai, vēl var paspēt iesēt puķes arī martā, kad būs vairāk saules gaismas.  ",
    ]
  },
  {
    "monthId": 3,
    "tips": [
      "Sējai gatavi? Labāk būtu vēl nedaudz paciesties: ja sēklas sēj 10. martā, tās sadīgs ap 15.-17. martu, un gandrīz tūlīt arī dienas garums sasniedz 12 h. Uz palodzes ievērojami uzlabosies gaismas apstākļi. ",
      "Jānogaida līdz brīdim, kad dārzā augsni drīkst rušināt. Pēc sniega nokušanas augsne kādu laiku ir pārmitra, bet strauji žūst. Apstrādājot pārāk mitru augsni, veidojas kunkuļi. Ja īsto brīdi nokavē, smaga augsne pārvēršas par klonu, bet viegla - put. Labi, ja ir iespēja izmantot frēzi, ko var arī nomāt. Jāpārrok arī rudenī uzraktās dobes. ",
      "Var likt diedzēt sēklai domātos kartupeļus. Kartupeļu diedzēšanas laikā uz bumbuļiem izveidojas īsi, drukni gaismas asni ar sakņu aizmetņiem pie asnu pamatnes. Sēklas bumbulis kļūst zaļgans. Reizē ar hlorofilu, kas veidojas gaismas ietekmē, kartupeļu bumbuļos rodas arī glikoalkaloīdi - indīgas vielas, kas nodrošina bumbuļu aizsardzību pret kaitēkļiem gluži kā kodne. ",
      "Marta sākumā var iesēt dēstiem partenokarpu hibrīdu gurķus (piemēram, ‘Sherpa F1’, ‘Adam F1’, ‘Kybria F1’, ‘Dingent F1’, ‘Mirabella F1’, ‘SV409’ u.c.), miniatūras paprikas un tomātus, baklažānus un pepino. Nav ieteicams sēt tieši kastēs vai podos, vispirms jāizaudzē dēsti. ",
      "Pelni ir lielisks mēslojums. Tos apkaisa ap augļu kokiem un krūmiem, uzber arī zālienam. Pelni noder arī kā pretslīdes līdzeklis pagalma celiņiem atkušņa laikā. ",
      "Uz upeņu un jāņogu zariem dažkārt veidojas lieli, resni, apaļi pumpuri, kuri vēlāk neplaukst. Tie ir pumpuru ērces (Eriophyes ribis) bojājumi. Tie noteikti jāsavāc un jāiznīcina. Ja invadēto pumpuru ir daudz, tad jāizgriež un jāiznīcina visi inficētie zari. ",
      "Marta beigās, kad dienas ir apmākušās, rozēm un citām ziemcietēm var nedaudz noņemt piesegumu. Bet martā vēl paturam augus piesegtus, jo gaisa temperatūra ir svārstīga un var pazemināties.",
      "Laiks atbrīvot augus no liekā, ja pērnā gada laksti palikuši, piemēram, astilbēm, ehinācijām, čikstenēm un citiem augiem, tie ir jānogriež. Arī graudzāļu laksti ir lieki, tos noņem, kamēr nav sākuši augt pirmie asni. ",
      "Pirmā grābšana. Kad nokusis sniegs un apžuvusi zeme, vajadzētu ar lapu grābekli nogrābt pagalma zālienu, tā aizvācot visus gružus, koku zariņus, lapas u.c.",
    ]
  },
  {
    "monthId": 4,
    "tips": [
      "Laistīšana ir svarīgākais dēstu kopšanas darbs. Tos nedrīkst ne pārlaistīt, ne kaltēt. Labāk ir laistīt katru reizi ar vāju kompleksā mēslojuma šķīdumu. Ērtāk ir izmantot šķidrus mēslojumus, izvēle ir plaša, un tie sevišķi daudz neatšķiras. Dēsti, kas paredzēti izstādīšanai atklātā laukā, 5-7 dienas pirms izstādīšanas jānorūda, pakāpeniski pieradinot pie lauka apstākļiem. Sākumā telpas pastiprināti vēdina, bet pēdējās 3-4 dienas dēstus pilnīgi novieto laukā, uz nakti piesedzot ar agrotīklu. Ja naktī sola salnas, dēsti uz nakti atkal jāpārvieto siltumnīcā. ",
      "Lai gurķi, tomāti vai paprika augtu stāvus un negāztos, podiņos iesprauž koka mietiņus (var iegādāties veikalos) augu atbalstam. ",
      "Pavasarī, gatavojot augsni sējai, ir vērts uz dažām dienām apsegt to ar caurspīdīgu polietilēna plēvi. Tas paātrinās augsnes iesilšanu, un sēklas straujāk sadīgs. ",
      "Aprīļa pirmajās dienās, kad augsnes temperatūra pārsniedz 80C, var sēt burkānus (Daucus carota sativus), sakņu pētersīļus (Petroselinum crispum), dilles (Anethum gaveolens), citus zaļumus. Sēj 15-20 cm attālās rindās. Rindstarpas platumu dārzā nosaka kapļa platums. Sējas dziļums 2-3 cm. Lai sēklas uzdīgtu strauji un vienlaikus, ir svarīgi, lai tās iesētu vienādi dziļi un sēklas gultne būtu gluda un cieta. To var panākt, iespiežot kapļa vai grābekļa kātu iepriekš uzrušinātā augsnē. ",
      "Var sēt zirņus (Pisum sativum) un dārza jeb cūku pupas (Vicia faba). Zirņus sēj 80-140 sēklas uz 1 m2 . Attālums starp rindām ir atkarīgs no šķirnes - zemos var sēt tuvāk, bet augstos tā, lai būtu viegli novākt ražu arī starp garajiem augiem. Vidēji zirņiem pietiek ar 25-45 cm lielu rindstarpu platumu. Atstatums starp sēklām rindā ap 10 cm. Sējas dziļums 4-5 cm. Cūku pupas sēj 6-10 cm dziļi. Svarīgi, lai visiem augiem pietiktu vietas un gaismas, tādēļ attālumam starp rindām jābūt 60-75 cm, bet starp augiem rindā 15-20 cm. Sēklu patēriņš 10-15 g uz m2.",
      "Aprīlī ogulājiem vajadzīgs slāpekļa mēslojums. Var lietot komplekso pavasara mēslojumu vai iestrādāt apdobes kompostu - satrūdējušus kūtsmēslus."
    ]
  },
  {
    "monthId": 5,
    "tips": [
      "Vispiemērotākais laiks kartupeļu (Solanum tuberosum) stādīšanai ir no aprīļa beigām līdz maija vidum. Maija otrajā pusē katra novēlota stādīšanas diena atstāj ietekmi uz ražas lielumu. Tomēr vēl līdz Jāņiem iestādīti kartupeļi dos pieklājīgāku ražu. ",
      "Mazdārziņos agros kartupeļus zemē drošāk likt ap 5.-15. maiju. Ja sēklas kartupeļus iznes no siltas telpas un tūlīt stāda augsnē, kas iesilusi tikai līdz 100C, dīgšanas periods ieilgst, tie var inficēties ar dīgstu puvi. ",
      "Siltumnīcā izkar dzeltenos līmes vairogus baltblusiņu un citu lidojošu kaitēkļu ierobežošanai. Vairogi jāizkar augu galotņu līmenī un jāceļ augstāk, augiem augot. Tie regulāri ik pēc 3-4 nedēļām janomaina neatkarīgi no pielipušo kaitēkļu daudzuma. ",
      "Visi augļu koki un ogulāju krūmi zied tieši maijā, tādēļ svarīgi parūpēties par apputeksnētājiem - bitēm, kamenēm un pat lapsenēm. To darbu nedrīkst traucēt, bet, ja nepieciešams lietot augu aizsardzības līdzekļus, smidzinājumus veic vakarā, kad kukaiņi devušies naktsmierā. ",
      "Lai saldie ķirši (Prunus avium) ražotu, nedrīkst blakus stādīt divus vienas šķirnes kokus. Jābūt vismaz 2-3 dažādām vienā laikā ziedošām šķirnēm, piemēram, ‘Iputj’, ‘Meelika’, ‘Paula’. Jo vairāk šķirņu, jo koki būs ražīgāki. Gandrīz visas agrāk ziedošās saldo ķiršu šķirnes savstarpēji labi apputeksnējas, izņēmums ir ‘Polli rubini’, kas zied ļoti agri, kā arī vēlu ziedošās ‘Drogana dzeltenais’, ‘Balzams’. Ziemīgais, pašauglīgais saldais ķirsis ir šķirne ‘Lapins’ ar lieliem augļiem, bet tam ir slikta salcietība.",
      "Vēl zied krokusi (Crocus spp.), zilsniedzītes (Scilla spp.) un citas pavasara sīpolpuķes. Augi jāmēslo ar slāpekli un kalciju saturošu minerālmēslojumu. Piemēram, ar kalcija nitrātu. Pavasarī ziedošās sīpolpuķes mēslo trīs reizes: pirmo reizi tad, kad virs zemes redzami augu asni, otro reizi, kad zied, un trešo reizi - pēc ziedēšanas, lai puķu sīpoli uzkrāj spēku ziedēšanai nākamajā pavasarī. ",
    ]
  },
  {
    "monthId": 6,
    "tips": [
      "Zemenes jālaista arī ražas laikā, tādējādi palielinot ražu. Laista uzmanīgi starp rindām, cenšoties nesamitrināt lapas. Ja laistīšanai izmanto zāliena laistītāju un nav iespējams pasargāt lapas no mitruma, labāk jālaista rīta pusē - liekais mitrums ātri apžūst un neveicina infekciju attīstību.  ",
      "Jūnija sākumā uzmanība jāpievērš sīpolu, puravu un ķiploku aizsardzībai pret sīpolu mušu (Delia antiqua), burkānu aizsardzībai pret burkānu lapu blusiņu (Trioza viridula), kāpostu kultūrās - pret spradžiem (Phyllotreta spp.) un balteņu (Pieris brassicae) kāpuriem. Mazdārziņos to visvieglāk var izdarīt, apsedzot visas kultūras ar agrotīklu. ",
      "Siltumnīcās regulāri jāveido augi, piešķirot tiem optimālu formu. To dara, pilnībā izņemot pazares (tomātiem) vai saīsinot par 2-3 lapām (gurķiem).",
      "Tomātu ražu var palielināt par 10-15%, atbalstot pirmos smagākos ķekarus ar speciāliem ķekaru turētājiem, kuri novērš ķekara aizlūšanu. Turētāji jāieliek ziedķekara pamatnē, sākoties tā ziedēšanai, nevis tad, kad kāts kļuvis resns un jau aizlūzis. ",
      "Ja vēlas pavairot vīnogulājus savā dārzā, visvienkāršāk ir pieliekt dzinumu un apraust ar zemi. Tas apsakņosies, un būs jauni stādiņi. Vēl interesants variants - vīnogulāja dzinumam apliek mitras sūnas vai augsni, apņem ar polietilēna maisiņu un apsien augšā un apakšā. Šajā vietā dzinums sāks veidot saknes. Kad sakņu kamols jau manāms, dzinumu nogriež - un stāds gatavs. ",
      "Lai stādi balkona kastē vai dārzā puķpodā labi ieaugtos, svarīgi, lai substrāta mitrums būtu lielāks nekā sakņu kamolā. Kad augi ir iedzīvojušies, jāveic pirmā papildmēslošana, aplaistot ar kompleksā mēslojuma šķīdumu. Ērtāk ir lietot jau gatavus šķidros mēslojumus, tos grūtāk pārdozēt. Pirmo papildmēslošanu veic pirms ziedpumpuru atvēršanās un atkārto ik pēc nedēļas. ",
    ]
  },
  {
    "monthId": 7,
    "tips": [
      "Siltā un pietiekami mitrā laikā gurķiem (Cucumis sativus), kabačiem (Cucurbita pepa), patisoniem (C. pepa) un tomātiem (Solanum lycapersicum) augļi nogatavojas ļoti strauji, un nereti tie jāievāc katru dienu. Īsaugļu gurķi pēc siltajām naktīm bieži vien jānolasa divreiz dienā - no rīta un vakarā, lai tie nepāraugtu.  ",
      "Līdz 20. jūlijam stāda ziedkāpostus. Kāpēc ziedkāposti augot izirst? Zema ziedkāpostu (Brassica oleracea subsp. botrytis) kvalitāte vasarā sarūgtina ne vienu vien audzētāju. Atbilde slēpjas šķirnes izvēlē un ziedkāpostiem nepieciešamās temperatūras nostiprināšanā. Lapu augšanai optimālā temperatūra ir 20-220C, bet galviņas ieriešas un aug 14-160C temperatūrā.  ",
      "Ziemas ķiplokus novāc, kad nodzeltējuši 30% stublāja. Ja nokavē, ārējās sausās zvīņas pārplīst, daiviņas sadalās jau uz lauka un daļa paliek augsnē. ",
      "Ja dobes atbrīvotas relatīvi agri - jūlija beigās vai augusta sākumā, bet otras ražas audzēšana nav ieplānota, var iesēt zaļmēslojumu, lai novērstu vēja eroziju un nezāļu augšanu. Sējai augustā derēs lapu sinepes (Sinapis alba), ziemas rapsis (Brassica napus) vai rudzi (Secale cereale).",
      "Ravē un vago kartupeļus, pārbauda, vai uz lapām nav kaitēkļu. Vago ik pēc 7-14 dienām, līdz kartupeļu augi ir tik lieli, ka lapas starp vagām sakļaujas. Pastāv viedoklis, ka vagošanu var veikt arī vēlāk, ja pēc lietus veidojas augsnes garoza vai nepieciešams ierobežot nezāles. ",
      "Kuras nezāles var likt kompostā? Ja kaudze ir neliela, plāna un paretam tiek papildināta ar jaunu kompostējamo materiālu devu, tajā droši var likt tikai viengadīgās nezāles. Daudzgadīgās, it sevišķi vārpatu (Agropyron repens), gārsu (Aegopodium podagraria), lielo nātri (Urtica dioica) un vībotni (Artemisia vulgaris) tādā kaudzē var likt tikai bez saknēm.  "
    ]
  },
  {
    "monthId": 8,
    "tips": [
      "Vēl var sēt dilles, redīsus un daikonus, salātus, spinātus, loku šķirņu sīpolus (‘Parade’, ‘White Lisbon’, ‘Savel’) novākšanai septembrī, mēneša vidū sēj skābenes nākamā gada ražai.  ",
      "Kartupeļu laksti jānopļauj divas nedēļas pirms plānotās ražas novākšanas. Tas veicina bumbuļu nobriešanu un mazina kartupeļu bojāšanos novākšanas laikā. Latvijā tradicionāli kartupeļus rok septembra sākumā, kamēr laiks ir pietiekami silts.  ",
      "Lai sīpoli straujāk nobriestu, ieteicams stādījumus pierullēt: ar grābekli aizlauzt lakstus, pieliecot pie zemes. Tad augiem lokos esošās barības vielas sāk pārvietoties uz sīpoliem, lapas ātrāk nokalst un sīpoliem veidojas sausas ārējās zvīņlapas. Kad 60-80% lakstu ir nokrituši, sāk dzeltēt un atmirst, ir piemērotākais laiks sīpolu novākšanai.  ",
      "Gurķus un ķirbjus turpina apdraudēt neīstā miltrasa. Pie pirmajām slimības pazīmēm - gaiši dzelteni, stūraini plankumi uz lapām, lapas apakšpusē eļļaini - augus var spēcināt ar lapu mēslojumu CalMax. ",
      "Krūmmellenes (Vaccinum corymbosum) nogatavojas pakāpeniski, agrīnās šķirnes augusta sākumā, vēlīnās pat septembrī. Lai ogas sasniegtu pilngatavību, vislabāko garšu un aromātu, jau zili iekrāsotām ogām jāļauj nogatavoties pie auga vēl 5-7 dienas. Vislabāk ir vākt kultūrmelleņu ražu vairakas reizes ar dažu dienu intervālu.  ",
      "Pēc ražas novākšanas zemeņu dobes jāmēslo. Ziedpumpuru ieriešanās notiek īsas dienas apstākļos, proti, septembrī. Tad zemenes jānodrošina ar barības elementiem, sevišķi slāpekli. Lai augi labi sagatavotos ziemai, nepieciešami arī citi barības elementi. Vispirms augiem noņem vecās un slimību bojātas lapas un stīgas. Pēc tam izkaisa komplekso mēslojumu ar paaugstinātu slāpekļa saturu 50-60 g/m2 un ierušina to zemē. Izmantojot organiskos mēslošanas līdzekļus, devai attiecīgi jābūt augstākai. Ja zemeņu mēslošanai izmanto kompostu, deva var būt 3-5 l/m2 ."
    ]
  },
  {
    "monthId": 9,
    "tips": [
      "Lauka gurķi (Cucumis sativus), ja tie vēl nedaudz ražo, jāapsedz ar agrotīklu. Septembrī to noņem tikai ražas vākšanas brīdī. ",
      "Galviņkāpostus (Brassica oleracea) mēneša beigās vāc skābēšanai. Skābējamām šķirnēm ir raksturīgs augsts cukuru saturs - ja novākšanu novilcina, tas bieži veicina pelēkās puves izplatīšanos. Arī kārtīgi notīrītajās galviņās var saglabāties infekcija, vēlāk tā traucēs skābēšanas procesu. ",
      "Galda bietes (Beta vulgaris) noteikti jānovāc pirms sala, citādi tās slikti glabāsies. Arī pāraugušas bietes slikti glabājas, nereti iekšpusē veidojas tukšumi.",
      "Mēneša beigās jāvāc sakņu selerijas (Apium graveolens). Tām, tāpat kā bietēm, nogriež lapas un saīsina sānsaknes.",
      "Septembrī neapkurināmajās plēves siltumnīcās tomāti vēl aug. Galvenais darbs - turpinat pelēkās puves ierobežošanu un tomātu regulāru mēslošanu ar kālija mēslojumiem (labāk ar kālija hlorīdu, jo hlors palīdz tomātiem cīnīties ar pelēko puvi). ",
      "Gatavojot zemi ķiploku (Allium sativum) stādīšanai, divas nedēļas iepriekš augsnē 10 cm virskārtā iestrādā mēslojumu Perlka 30-40 g/m2 . Pirms stādīšanas papildus iestrādā trihodermīnu vai citu mikrobioloģisko līdzekli.",
      "Lai saglabātu izaugušās ražas kvalitāti, novākšanas laikā maksimāli jāizvairās no kartupeļu traumēšanas. Bumbulim nepatīkami ir ne tikai mehāniski iešķēlumi, bet arī sasitumi. Ar laiku sasitumu vietās audi zem mizas kļūst tumši, bojātās vietas vieglāk pakļaujas slimību patogēniem.",
      "Kokos nedrīkst atstāt slimību un kaitēkļu bojātus augļus. Tie jānolasa atsevišķā vākšanas reizē un jāiznīcina. Drošākais utilizēšanas veids ir kompostēšana kopā ar citām augu atliekām, pievienojot biokompostētāju. ",
      "Apgriež parastā ceriņa (Syringa vulgaris) stādījumus, kas izstiepušies 4-5 m gari. To sauc par atjaunojošo apgriešanu, kas piemērota nekoptiem aizaugušiem krūmiem. Stumbrus apzāģē 1-1,5 m augstumā. Tad attīstās snaudošie pumpuri un veidojas ūdenszari, kas nākamajā gadā būs jāparetina. Iespējams, vajadzēs gaidīt 2-3 gadus, līdz atjaunotie ceriņi atsāks ziedēt.",
    ]
  },
  {
    "monthId": 10,
    "tips": [
      'Ķiplokus (Allium sativum) stāda oktobra otrajā pusē 70 cm attālās rindās 5-8 cm dziļi, daiviņas izvietojot 10 cm attālumā citu no citas. Ķiploku galviņas sadala daiviņās neilgi pirms stādīšanas. Atkarībā no izmēra optimālais skaits ir 25-40 daiviņas kvadrātmetrā. Mazdārziņos ķiplokus parasti stāda rindā 10-15 cm attālumā citu no cita 7-10 cm dziļi (3-5 cm ir par seklu), lai stādījums neciestu kailsalā.',
      "Kad rabarberiem (Rheum rhabarbarum) atmirst lapas, pirms sala augus bagātīgi piesedz ar satrūdējušu kūtsmēslu vai melnzemes mulču. Tas pasargā no kailsala, ka arī ielabo zemi. Labs mulčas materiāls ir arī nopļauta zāle un koku lapas. Rabarberiem nav kopīgu slimību ar kokiem, tādēļ no infekcijas uzkrāšanās nav jābaidās. ",
      "Tomātus (Solanum lycopersicum) un papriku (Capsicum annuum) bieži nākas novākt vēl pazaļus, jo nepietiekamā siltuma dēļ tie vairs nespēj nogatavoties uz augiem. Vācot pēdējo tomātu un paprikas ražu, augļi rūpīgi jāšķiro, izmetot visus kaut nedaudz puves skartos. Nogatavināšanai ir vērts atstāt tikai pilnīgi izaugušus, kaitēkļu un slimību neskartus augļus. Vislabāk tos salikt nelielās koka vai plastmasas kastēs un novietot telpā 18-220C temperatūrā, lai straujāk iekrāsojas. ",
      "Ja gadījies, ka dārzā izzied salāti vai rukola, vai kāds cits viengadīgs garšaugs, to ziedkopas iekar siltumnīcā, lai izbirst sēklas: pavasarī tās sadīgs labāk par pirktajām.",
      "Pārrok kompostu. Svaigāko zaļaugu masu klāj apakšā un pa kārtai uzber melnzemi. ",
      "Sakārto dārza laistīšanas sistēmu. Izlaiž ūdeni, ieziemo (nereti noņem) dārza krānu. Satin un pakar šļūtenes. ",
      "Nokaltušos augus var sadedzināt, bet parasti tie ir vēl pārāk sulīgi un lāgā nedeg. Atliek sagriezt ar dārza šķērēm ap 30-40 cm garos posmos un likt kompostā. ",
    ]
  },
  {
    "monthId": 11,
    "tips": [
      "Visneaizsargātākie ziemā ir rudenī iegādātie un neiestādītie stādiņi. Tos pierok, lai saknes būtu zem zemes, un apsedz ar egļu zariem, lai neapgrauž peles.",
      "Problemātiskie ziemotāji ir kauleņkoki (persiki, aprikozes, ķirši) un visi pirmā gada kociņi. Tos noteikti kaļķo un izveido segu stumbram. Lai aptītu ar skujām, salmiem, džutas maisiem un citu materiālu, jau laikus blakus kokiem iedzen mietiņus, pie kuriem stiprināt siltinājumu. Mazos kociņus pirmos 2-3 dzīves gadus noteikti vajag balsināt, tādēļ izvēlas segumu, ko katru gadu var noņemt. ",
      "Sakņu zonā uzber mulču jaunajiem kociņiem un tiem, kas jutīgi pret salu, piemēram, pundura, ģimenes ābelēm un kolonnābelēm. To sakņu sistēma ir maza un sekla. Sakņu kamols parasti ir aptuveni tikpat liels kā vainags. Glīti izskatās, ja kokam veido apdobi. Jaunajiem kociņiem tas ir sevišķi nepieciešams. ",
      "Vēlā rudenī, kad dārzā augsne sasalusi, persiki (Prunus persica) jāpiesedz un janoēno ar skujām vai agrotīklu. Audzējot siltumnīcā, persiki ziemo bez papildu pieseguma, tikai jāraugās, lai augsne pārāk neizžūtu. Ziemā vēlams ap stumbru uzmest sniegu - tas veido teicamu aizsargslāni pret salu.",
      "Kailajos kokos labi redzamas mūmijas - puvušie augļi. Tie nākamgad kļūs par slimību perēkļiem, tādēļ augļus notrauš un iznīcina. ",
      "Ogu krūmiem var izgriezt vecos zarus.",
      "Ja augsne ir ļoti sausa, kultūrmellenes (Vaccinuum corymbosum) bagatīgi aplaista. Šiem augiem ir sevišķi smalka un jutīga sakņu sistēma. Mulčē ar skābo kūdru, jo, vasarā laistot, augsne nereti ir noskalojusies no saknēm. ",
      "Kamēr zeme nav sasalusi, var stādīt tulpes un citas pavasarī ziedošās sīpolpuķes.",
      "Rudenī ir īstais laiks balsināt koku stumbrus. Rudens lietū daļa balsinājuma noskalosies, bet tas nekas: nepieciešamais daudzums tomēr paliks. Galvenais, lai koka stumbrs kļūst gaišāks, to mazāk karsē saule un lai neplaisā miza. Tas sevišķi svarīgi kauleņkokiem, tādēļ tos vajadzētu kaļķot pirmām kārtām. Balsinājums kalpo gan saules apdegumu, gan slimību profilaksei. Balsinot miza kļūst gluda un nokrīt ķērpji. Koka vainagu var kaļķot ar pulverizatoru. "
    ]
  },
  {
    "monthId": 12,
    "tips": [
      "Jaunajiem augļu kociņiem ap stumbriem var aplikt skujas vai agrotīklu gan pret grauzējiem, gan arī - lai neplaisā stumbru miza. ",
      "Ja rožkāpostus (Brassica oleracea var. gemmifera) vāc tagad, labāk ir nocirst visu augu. Neapdarinātus stublājus (bez lapām, bet lielākā to daļa ap šo laiku parasti nobirst) var uzglabāt pat ilgāk. Galviņas atdala no stublāja tieši pirms izmantošanas. Šo darbu labāk veikt rupja auduma cimdos. ",
      "Decembrī daudz rūpju sagādā dārzeņu uzglabāšana stirpās. Krasi mainoties gaisa temperatūrai, jāpaspēj laikus palielināt seguma kārtu un aizvērt vēdlūkas. Katrā stirpā vēlams ievietot termometru, lai īstajā brīdī pagūtu atvērt gaisa ejas un nepieļautu dārzeņu pārkaršanu. ",
      "Jāseko līdzi produktu glabāšanas apstākļiem pagrabā. Ja sinoptiķi sola salu, laikus jāaiztaisa ventilācijas lūkas. Atkušņa laikā tās atkal jāver vaļā, lai pazeminātu gaisa temperatūru un gaisa mitrumu pagrabā.",
      "Pēc intensīvas snigšanas no siltumnīcas jumta jānotīra sniegs, lai nepieļautu konstrukcijas sabrukšanu. Sniegs regulāri jānovāc arī gar siltumnīcas sienām, lai tās nesabojātu kupenas svars. ",
      "Ziemas laiks jāizmanto sevis izglītošanai, lasot dārzkopības žurnālus un grāmatas. Vērts iepazīties ar selekcijas firmu jaunākajiem piedāvājumiem internetā, kā arī apmeklējot lekcijas un seminārus, ko rīko dārzkopības entuziastu klubs Tomāts, Latvijas Lauku konsultāciju un izglītības centrs, pašvaldības, dārzkopības preču tirgotāji un citi.  ",
      "Jāizvērtē aizvadītās sezonas rezultāti. Kura šķirne patika un kura ne? Laikus jāizlemj, kuru šķirņu dēstus audzēs paši, bet kurus pasūtīs pie profesionāliem audzētājiem vai pirks tirdziņos. Daudzi stādu un dēstu audzētāji ir pieejami sociālajos tīklos, un tiem laikus jāpasūta vēlamās šķirnes. ",
      "Dārzā jāierīko putnu barotavas. Piebarošana ir sevišķi nepieciešama aukstā, sniegotā laikā, kad putni nespēj atrast barību. Barotavas veicina bioloģisko daudzveidību un rosina bērnu interesi par dabu un tās aizsardzību. Putnu piebarošanai der dažādu augu sēklas, zīlītēm, zilzīlītēm un vēl dažiem putniem - arī nesālīts speķis. Jāatceras barotavas papildināt, jo putni pierod pie savām barošanas vietām. Ja cienasts būs vienmēr, putni iedzīvosies un pavasarī tuvumā meklēs ligzdu vietas.  "
    ]
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
var publicationsList = [
  {
    "text":
        "Sviķe, S., 2018. A New Dictionary of Botanical Terms: Data Analysis of a Lexicographic Survey. Economics World. New York: David Publishing Company Journal. May-June 2018, 6 (3). 228–241.",
    "links": [
      "http://www.davidpublisher.com/index.php/Home/Article/index?id=35063.html"
    ]
  },
  {
    "text":
        "Sviķe, S., 2017. A New Dictionary of Botanical Terms: an Insight into the Compilation Project of the Dictionary. Jeļena Titko (ed) Emerging Trends in Economics, Culture and Humanities (etECH2017). Conference Proceedings. Rīga: Ekonomikas un kultūras augstskola, 22–30.",
    "links": ["https://www.augstskola.lv/upload/Conf_proceedings_2017.pdf"]
  },
  {
    "text":
        "Stalažs, A., 2015. Asteru, miķelīšu, ziemasteru un dažu citu radniecīgo ģinšu sugu latviskie nosaukumi. Scripta Letonica 2(1). Dobele: RPD Science. 24–30.",
    "links": [
      "http://www.rpd-science.org/ScrLet/V002/Scripta_Letonica_2-1_2015_Art_4.pdf"
    ]
  }
];
