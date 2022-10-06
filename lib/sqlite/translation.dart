class Translation {
  int id;
  int translation_group;
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
  String image_url;
  String notes;
  String tezaurs_url;
  String tezaurs_definition;
  String foliage_height;
  String plant_height;
  String plant_width;
  String plant_group;
  String plant_subgroup;

  Translation(
      this.id,
      this.translation_group,
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
      this.image_url,
      this.notes,
      this.tezaurs_url,
      this.tezaurs_definition,
      this.foliage_height,
      this.plant_width,
      this.plant_group,
      this.plant_subgroup);

  Translation.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    translation_group = map['translation_group'];
    lv = map['lv'];
    lv_apz = map['lv_apz'];
    lv_prio = map['lv_prio'];
    la = map['la'];
    en = map['en'];
    de = map['de'];
    de_apz = map['de_apz'];
    de_prio = map['de_prio'];
    ru = map['ru'];
    ru_apz = map['ru_apz'];
    ru_prio = map['ru_prio'];
    image_url = map['image_url'];
    notes = map['notes'];
    tezaurs_url = map['tezaurs_url'];
    tezaurs_definition = map['tezaurs_definition'];
    foliage_height = map['foliage_height'];
    plant_height = map['plant_height'].toString();
    plant_width = map['plant_width'].toString();
    plant_group = map['plant_group'];
    plant_subgroup = map['plant_subgroup'];
  }

  Map toJson() => {
        "id": id,
        "translation_group": translation_group,
        "lv": lv,
        "lv_apz": lv_apz,
        "lv_prio": lv_prio,
        "la": la,
        "en": en,
        "de": de,
        "de_apz": de_apz,
        "de_prio": de_prio,
        "ru": ru,
        "ru_apz": ru_apz,
        "ru_prio": ru_prio,
        "image_url": image_url,
        "notes": notes,
        "tezaurs_url": tezaurs_url,
        "tezaurs_definition": tezaurs_definition,
        "foliage_height": foliage_height,
        "plant_width": plant_width,
        "plant_group": plant_group,
        "plant_subgroup": plant_subgroup
      };
}
