// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'models/models.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:2683551888199629224",
        "lastPropertyId": "4:3758972551491821640",
        "name": "CustomColor",
        "properties": [
          {"id": "1:4988748134080012385", "name": "id", "type": 6, "flags": 1},
          {
            "id": "2:4348513082327476792",
            "name": "colorIndex",
            "type": 6,
            "flags": 40,
            "indexId": "1:5238349987439200121"
          },
          {"id": "3:8124728802137237650", "name": "title", "type": 9},
          {"id": "4:3758972551491821640", "name": "colorCode", "type": 9}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "2:3460610557230953992",
        "lastPropertyId": "2:5491541817678450843",
        "name": "FlowersColors",
        "properties": [
          {"id": "1:777685363715707197", "name": "id", "type": 6, "flags": 1},
          {"id": "2:5491541817678450843", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "3:2452940517196892006",
        "lastPropertyId": "2:8213055079628100820",
        "name": "FruitsColors",
        "properties": [
          {"id": "1:90234074131202362", "name": "id", "type": 6, "flags": 1},
          {"id": "2:8213055079628100820", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "4:8722602640440301466",
        "lastPropertyId": "2:3997485097439033332",
        "name": "LeafsColors",
        "properties": [
          {"id": "1:6022467500707801981", "name": "id", "type": 6, "flags": 1},
          {"id": "2:3997485097439033332", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "5:5425647106777311919",
        "lastPropertyId": "2:7959414578199276658",
        "name": "NeedlesColors",
        "properties": [
          {"id": "1:6227773956193274423", "name": "id", "type": 6, "flags": 1},
          {"id": "2:7959414578199276658", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "6:4567377864617181657",
        "lastPropertyId": "2:8245701959917774120",
        "name": "PlantType",
        "properties": [
          {"id": "1:7944321856025520049", "name": "id", "type": 6, "flags": 1},
          {"id": "2:8245701959917774120", "name": "title", "type": 9}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "7:6072738139166872678",
        "lastPropertyId": "22:1161895447632494151",
        "name": "Translation",
        "properties": [
          {"id": "1:7039870096612976818", "name": "id", "type": 6, "flags": 1},
          {"id": "2:973039466204566340", "name": "wordsGroupId", "type": 6},
          {"id": "3:4518353453614983906", "name": "lv", "type": 9},
          {"id": "4:7596387517274526657", "name": "lv_apz", "type": 9},
          {"id": "5:1206052273046985637", "name": "lv_prio", "type": 6},
          {"id": "6:1705626030216646035", "name": "la", "type": 9},
          {"id": "7:1062467891763622841", "name": "en", "type": 9},
          {"id": "8:2063455700139359659", "name": "de", "type": 9},
          {"id": "9:6143344552753737577", "name": "de_apz", "type": 9},
          {"id": "10:2915491340508009880", "name": "de_prio", "type": 6},
          {"id": "11:4142597688827965238", "name": "ru", "type": 9},
          {"id": "12:1822118884771747681", "name": "ru_apz", "type": 9},
          {"id": "13:1972496382822722128", "name": "ru_prio", "type": 6},
          {"id": "14:2441992420161225287", "name": "piezimes", "type": 9},
          {"id": "15:3772523888664479617", "name": "attela_links", "type": 9},
          {"id": "16:2275402150684209862", "name": "link_tez", "type": 9},
          {"id": "17:3961453271220193221", "name": "showLA", "type": 1},
          {"id": "18:7290635148527207932", "name": "showLV", "type": 1},
          {"id": "19:4018071999564793861", "name": "showEN", "type": 1},
          {"id": "20:5913665159279911048", "name": "showDE", "type": 1},
          {"id": "21:6989318315673591662", "name": "showRU", "type": 1},
          {"id": "22:1161895447632494151", "name": "plantTypeID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "8:8461370933261220478",
        "lastPropertyId": "3:1618742280192239237",
        "name": "TranslationWithFlowersColor",
        "properties": [
          {"id": "1:270379255819265477", "name": "id", "type": 6, "flags": 1},
          {"id": "2:8612615921146490109", "name": "translationID", "type": 6},
          {"id": "3:1618742280192239237", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "9:3494228399476103548",
        "lastPropertyId": "3:4472523163774200293",
        "name": "TranslationWithFruitsColor",
        "properties": [
          {"id": "1:9018605033386080364", "name": "id", "type": 6, "flags": 1},
          {"id": "2:1900596157149927517", "name": "translationID", "type": 6},
          {"id": "3:4472523163774200293", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "10:7881186908689296347",
        "lastPropertyId": "3:2053992761036194924",
        "name": "TranslationWithLeafsColor",
        "properties": [
          {"id": "1:3029797189178570200", "name": "id", "type": 6, "flags": 1},
          {"id": "2:5342126198814580688", "name": "translationID", "type": 6},
          {"id": "3:2053992761036194924", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "11:1976375422800812994",
        "lastPropertyId": "3:6168541787284294386",
        "name": "TranslationWithMonths",
        "properties": [
          {"id": "1:5060805495366747072", "name": "id", "type": 6, "flags": 1},
          {"id": "2:2477154197585044567", "name": "translationID", "type": 6},
          {"id": "3:6168541787284294386", "name": "monthNumber", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "12:4171471033305966773",
        "lastPropertyId": "3:8897610358364840964",
        "name": "TranslationWithNeedlesColor",
        "properties": [
          {"id": "1:7479595031114092952", "name": "id", "type": 6, "flags": 1},
          {"id": "2:5227688890823141455", "name": "translationID", "type": 6},
          {"id": "3:8897610358364840964", "name": "colorID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "13:2924189543417418257",
        "lastPropertyId": "3:1013897354168842013",
        "name": "TranslationWithPlantType",
        "properties": [
          {"id": "1:69580186509087162", "name": "id", "type": 6, "flags": 1},
          {"id": "2:7333794919803896549", "name": "translationID", "type": 6},
          {"id": "3:1013897354168842013", "name": "plantTypeID", "type": 6}
        ],
        "relations": [],
        "backlinks": []
      }
    ],
    "lastEntityId": "13:2924189543417418257",
    "lastIndexId": "1:5238349987439200121",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[CustomColor] = EntityDefinition<CustomColor>(
      model: model.getEntityByUid(2683551888199629224),
      toOneRelations: (CustomColor object) => [],
      toManyRelations: (CustomColor object) => {},
      getId: (CustomColor object) => object.id,
      setId: (CustomColor object, int id) {
        object.id = id;
      },
      objectToFB: (CustomColor object, fb.Builder fbb) {
        final offsettitle =
            object.title == null ? null : fbb.writeString(object.title);
        final offsetcolorCode =
            object.colorCode == null ? null : fbb.writeString(object.colorCode);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.colorIndex);
        fbb.addOffset(2, offsettitle);
        fbb.addOffset(3, offsetcolorCode);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = CustomColor();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.colorIndex = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        object.title = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.colorCode = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        return object;
      });
  bindings[FlowersColors] = EntityDefinition<FlowersColors>(
      model: model.getEntityByUid(3460610557230953992),
      toOneRelations: (FlowersColors object) => [],
      toManyRelations: (FlowersColors object) => {},
      getId: (FlowersColors object) => object.id,
      setId: (FlowersColors object, int id) {
        object.id = id;
      },
      objectToFB: (FlowersColors object, fb.Builder fbb) {
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.colorID);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = FlowersColors();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[FruitsColors] = EntityDefinition<FruitsColors>(
      model: model.getEntityByUid(2452940517196892006),
      toOneRelations: (FruitsColors object) => [],
      toManyRelations: (FruitsColors object) => {},
      getId: (FruitsColors object) => object.id,
      setId: (FruitsColors object, int id) {
        object.id = id;
      },
      objectToFB: (FruitsColors object, fb.Builder fbb) {
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.colorID);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = FruitsColors();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[LeafsColors] = EntityDefinition<LeafsColors>(
      model: model.getEntityByUid(8722602640440301466),
      toOneRelations: (LeafsColors object) => [],
      toManyRelations: (LeafsColors object) => {},
      getId: (LeafsColors object) => object.id,
      setId: (LeafsColors object, int id) {
        object.id = id;
      },
      objectToFB: (LeafsColors object, fb.Builder fbb) {
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.colorID);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = LeafsColors();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[NeedlesColors] = EntityDefinition<NeedlesColors>(
      model: model.getEntityByUid(5425647106777311919),
      toOneRelations: (NeedlesColors object) => [],
      toManyRelations: (NeedlesColors object) => {},
      getId: (NeedlesColors object) => object.id,
      setId: (NeedlesColors object, int id) {
        object.id = id;
      },
      objectToFB: (NeedlesColors object, fb.Builder fbb) {
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.colorID);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = NeedlesColors();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[PlantType] = EntityDefinition<PlantType>(
      model: model.getEntityByUid(4567377864617181657),
      toOneRelations: (PlantType object) => [],
      toManyRelations: (PlantType object) => {},
      getId: (PlantType object) => object.id,
      setId: (PlantType object, int id) {
        object.id = id;
      },
      objectToFB: (PlantType object, fb.Builder fbb) {
        final offsettitle =
            object.title == null ? null : fbb.writeString(object.title);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsettitle);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = PlantType();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.title = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[Translation] = EntityDefinition<Translation>(
      model: model.getEntityByUid(6072738139166872678),
      toOneRelations: (Translation object) => [],
      toManyRelations: (Translation object) => {},
      getId: (Translation object) => object.id,
      setId: (Translation object, int id) {
        object.id = id;
      },
      objectToFB: (Translation object, fb.Builder fbb) {
        final offsetlv = object.lv == null ? null : fbb.writeString(object.lv);
        final offsetlv_apz =
            object.lv_apz == null ? null : fbb.writeString(object.lv_apz);
        final offsetla = object.la == null ? null : fbb.writeString(object.la);
        final offseten = object.en == null ? null : fbb.writeString(object.en);
        final offsetde = object.de == null ? null : fbb.writeString(object.de);
        final offsetde_apz =
            object.de_apz == null ? null : fbb.writeString(object.de_apz);
        final offsetru = object.ru == null ? null : fbb.writeString(object.ru);
        final offsetru_apz =
            object.ru_apz == null ? null : fbb.writeString(object.ru_apz);
        final offsetpiezimes =
            object.piezimes == null ? null : fbb.writeString(object.piezimes);
        final offsetattela_links = object.attela_links == null
            ? null
            : fbb.writeString(object.attela_links);
        final offsetlink_tez =
            object.link_tez == null ? null : fbb.writeString(object.link_tez);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.wordsGroupId);
        fbb.addOffset(2, offsetlv);
        fbb.addOffset(3, offsetlv_apz);
        fbb.addInt64(4, object.lv_prio);
        fbb.addOffset(5, offsetla);
        fbb.addOffset(6, offseten);
        fbb.addOffset(7, offsetde);
        fbb.addOffset(8, offsetde_apz);
        fbb.addInt64(9, object.de_prio);
        fbb.addOffset(10, offsetru);
        fbb.addOffset(11, offsetru_apz);
        fbb.addInt64(12, object.ru_prio);
        fbb.addOffset(13, offsetpiezimes);
        fbb.addOffset(14, offsetattela_links);
        fbb.addOffset(15, offsetlink_tez);
        fbb.addBool(16, object.showLA);
        fbb.addBool(17, object.showLV);
        fbb.addBool(18, object.showEN);
        fbb.addBool(19, object.showDE);
        fbb.addBool(20, object.showRU);
        fbb.addInt64(21, object.plantTypeID);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Translation();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.wordsGroupId = fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        object.lv = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.lv_apz = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        object.lv_prio = fb.Int64Reader().vTableGet(buffer, rootOffset, 12);
        object.la = fb.StringReader().vTableGet(buffer, rootOffset, 14);
        object.en = fb.StringReader().vTableGet(buffer, rootOffset, 16);
        object.de = fb.StringReader().vTableGet(buffer, rootOffset, 18);
        object.de_apz = fb.StringReader().vTableGet(buffer, rootOffset, 20);
        object.de_prio = fb.Int64Reader().vTableGet(buffer, rootOffset, 22);
        object.ru = fb.StringReader().vTableGet(buffer, rootOffset, 24);
        object.ru_apz = fb.StringReader().vTableGet(buffer, rootOffset, 26);
        object.ru_prio = fb.Int64Reader().vTableGet(buffer, rootOffset, 28);
        object.piezimes = fb.StringReader().vTableGet(buffer, rootOffset, 30);
        object.attela_links =
            fb.StringReader().vTableGet(buffer, rootOffset, 32);
        object.link_tez = fb.StringReader().vTableGet(buffer, rootOffset, 34);
        object.showLA = fb.BoolReader().vTableGet(buffer, rootOffset, 36);
        object.showLV = fb.BoolReader().vTableGet(buffer, rootOffset, 38);
        object.showEN = fb.BoolReader().vTableGet(buffer, rootOffset, 40);
        object.showDE = fb.BoolReader().vTableGet(buffer, rootOffset, 42);
        object.showRU = fb.BoolReader().vTableGet(buffer, rootOffset, 44);
        object.plantTypeID = fb.Int64Reader().vTableGet(buffer, rootOffset, 46);
        return object;
      });
  bindings[TranslationWithFlowersColor] =
      EntityDefinition<TranslationWithFlowersColor>(
          model: model.getEntityByUid(8461370933261220478),
          toOneRelations: (TranslationWithFlowersColor object) => [],
          toManyRelations: (TranslationWithFlowersColor object) => {},
          getId: (TranslationWithFlowersColor object) => object.id,
          setId: (TranslationWithFlowersColor object, int id) {
            object.id = id;
          },
          objectToFB: (TranslationWithFlowersColor object, fb.Builder fbb) {
            fbb.startTable();
            fbb.addInt64(0, object.id ?? 0);
            fbb.addInt64(1, object.translationID);
            fbb.addInt64(2, object.colorID);
            fbb.finish(fbb.endTable());
            return object.id ?? 0;
          },
          objectFromFB: (Store store, Uint8List fbData) {
            final buffer = fb.BufferContext.fromBytes(fbData);
            final rootOffset = buffer.derefObject(0);

            final object = TranslationWithFlowersColor();
            object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
            object.translationID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
            object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
            return object;
          });
  bindings[TranslationWithFruitsColor] =
      EntityDefinition<TranslationWithFruitsColor>(
          model: model.getEntityByUid(3494228399476103548),
          toOneRelations: (TranslationWithFruitsColor object) => [],
          toManyRelations: (TranslationWithFruitsColor object) => {},
          getId: (TranslationWithFruitsColor object) => object.id,
          setId: (TranslationWithFruitsColor object, int id) {
            object.id = id;
          },
          objectToFB: (TranslationWithFruitsColor object, fb.Builder fbb) {
            fbb.startTable();
            fbb.addInt64(0, object.id ?? 0);
            fbb.addInt64(1, object.translationID);
            fbb.addInt64(2, object.colorID);
            fbb.finish(fbb.endTable());
            return object.id ?? 0;
          },
          objectFromFB: (Store store, Uint8List fbData) {
            final buffer = fb.BufferContext.fromBytes(fbData);
            final rootOffset = buffer.derefObject(0);

            final object = TranslationWithFruitsColor();
            object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
            object.translationID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
            object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
            return object;
          });
  bindings[TranslationWithLeafsColor] =
      EntityDefinition<TranslationWithLeafsColor>(
          model: model.getEntityByUid(7881186908689296347),
          toOneRelations: (TranslationWithLeafsColor object) => [],
          toManyRelations: (TranslationWithLeafsColor object) => {},
          getId: (TranslationWithLeafsColor object) => object.id,
          setId: (TranslationWithLeafsColor object, int id) {
            object.id = id;
          },
          objectToFB: (TranslationWithLeafsColor object, fb.Builder fbb) {
            fbb.startTable();
            fbb.addInt64(0, object.id ?? 0);
            fbb.addInt64(1, object.translationID);
            fbb.addInt64(2, object.colorID);
            fbb.finish(fbb.endTable());
            return object.id ?? 0;
          },
          objectFromFB: (Store store, Uint8List fbData) {
            final buffer = fb.BufferContext.fromBytes(fbData);
            final rootOffset = buffer.derefObject(0);

            final object = TranslationWithLeafsColor();
            object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
            object.translationID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
            object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
            return object;
          });
  bindings[TranslationWithMonths] = EntityDefinition<TranslationWithMonths>(
      model: model.getEntityByUid(1976375422800812994),
      toOneRelations: (TranslationWithMonths object) => [],
      toManyRelations: (TranslationWithMonths object) => {},
      getId: (TranslationWithMonths object) => object.id,
      setId: (TranslationWithMonths object, int id) {
        object.id = id;
      },
      objectToFB: (TranslationWithMonths object, fb.Builder fbb) {
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(1, object.translationID);
        fbb.addInt64(2, object.monthNumber);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = TranslationWithMonths();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.translationID =
            fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
        object.monthNumber = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
        return object;
      });
  bindings[TranslationWithNeedlesColor] =
      EntityDefinition<TranslationWithNeedlesColor>(
          model: model.getEntityByUid(4171471033305966773),
          toOneRelations: (TranslationWithNeedlesColor object) => [],
          toManyRelations: (TranslationWithNeedlesColor object) => {},
          getId: (TranslationWithNeedlesColor object) => object.id,
          setId: (TranslationWithNeedlesColor object, int id) {
            object.id = id;
          },
          objectToFB: (TranslationWithNeedlesColor object, fb.Builder fbb) {
            fbb.startTable();
            fbb.addInt64(0, object.id ?? 0);
            fbb.addInt64(1, object.translationID);
            fbb.addInt64(2, object.colorID);
            fbb.finish(fbb.endTable());
            return object.id ?? 0;
          },
          objectFromFB: (Store store, Uint8List fbData) {
            final buffer = fb.BufferContext.fromBytes(fbData);
            final rootOffset = buffer.derefObject(0);

            final object = TranslationWithNeedlesColor();
            object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
            object.translationID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
            object.colorID = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
            return object;
          });
  bindings[TranslationWithPlantType] =
      EntityDefinition<TranslationWithPlantType>(
          model: model.getEntityByUid(2924189543417418257),
          toOneRelations: (TranslationWithPlantType object) => [],
          toManyRelations: (TranslationWithPlantType object) => {},
          getId: (TranslationWithPlantType object) => object.id,
          setId: (TranslationWithPlantType object, int id) {
            object.id = id;
          },
          objectToFB: (TranslationWithPlantType object, fb.Builder fbb) {
            fbb.startTable();
            fbb.addInt64(0, object.id ?? 0);
            fbb.addInt64(1, object.translationID);
            fbb.addInt64(2, object.plantTypeID);
            fbb.finish(fbb.endTable());
            return object.id ?? 0;
          },
          objectFromFB: (Store store, Uint8List fbData) {
            final buffer = fb.BufferContext.fromBytes(fbData);
            final rootOffset = buffer.derefObject(0);

            final object = TranslationWithPlantType();
            object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
            object.translationID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 6);
            object.plantTypeID =
                fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
            return object;
          });

  return ModelDefinition(model, bindings);
}

class CustomColor_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final colorIndex =
      QueryIntegerProperty(entityId: 1, propertyId: 2, obxType: 6);
  static final title =
      QueryStringProperty(entityId: 1, propertyId: 3, obxType: 9);
  static final colorCode =
      QueryStringProperty(entityId: 1, propertyId: 4, obxType: 9);
}

class FlowersColors_ {
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 1, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 2, propertyId: 2, obxType: 6);
}

class FruitsColors_ {
  static final id =
      QueryIntegerProperty(entityId: 3, propertyId: 1, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 3, propertyId: 2, obxType: 6);
}

class LeafsColors_ {
  static final id =
      QueryIntegerProperty(entityId: 4, propertyId: 1, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 4, propertyId: 2, obxType: 6);
}

class NeedlesColors_ {
  static final id =
      QueryIntegerProperty(entityId: 5, propertyId: 1, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 5, propertyId: 2, obxType: 6);
}

class PlantType_ {
  static final id =
      QueryIntegerProperty(entityId: 6, propertyId: 1, obxType: 6);
  static final title =
      QueryStringProperty(entityId: 6, propertyId: 2, obxType: 9);
}

class Translation_ {
  static final id =
      QueryIntegerProperty(entityId: 7, propertyId: 1, obxType: 6);
  static final wordsGroupId =
      QueryIntegerProperty(entityId: 7, propertyId: 2, obxType: 6);
  static final lv = QueryStringProperty(entityId: 7, propertyId: 3, obxType: 9);
  static final lv_apz =
      QueryStringProperty(entityId: 7, propertyId: 4, obxType: 9);
  static final lv_prio =
      QueryIntegerProperty(entityId: 7, propertyId: 5, obxType: 6);
  static final la = QueryStringProperty(entityId: 7, propertyId: 6, obxType: 9);
  static final en = QueryStringProperty(entityId: 7, propertyId: 7, obxType: 9);
  static final de = QueryStringProperty(entityId: 7, propertyId: 8, obxType: 9);
  static final de_apz =
      QueryStringProperty(entityId: 7, propertyId: 9, obxType: 9);
  static final de_prio =
      QueryIntegerProperty(entityId: 7, propertyId: 10, obxType: 6);
  static final ru =
      QueryStringProperty(entityId: 7, propertyId: 11, obxType: 9);
  static final ru_apz =
      QueryStringProperty(entityId: 7, propertyId: 12, obxType: 9);
  static final ru_prio =
      QueryIntegerProperty(entityId: 7, propertyId: 13, obxType: 6);
  static final piezimes =
      QueryStringProperty(entityId: 7, propertyId: 14, obxType: 9);
  static final attela_links =
      QueryStringProperty(entityId: 7, propertyId: 15, obxType: 9);
  static final link_tez =
      QueryStringProperty(entityId: 7, propertyId: 16, obxType: 9);
  static final showLA =
      QueryBooleanProperty(entityId: 7, propertyId: 17, obxType: 1);
  static final showLV =
      QueryBooleanProperty(entityId: 7, propertyId: 18, obxType: 1);
  static final showEN =
      QueryBooleanProperty(entityId: 7, propertyId: 19, obxType: 1);
  static final showDE =
      QueryBooleanProperty(entityId: 7, propertyId: 20, obxType: 1);
  static final showRU =
      QueryBooleanProperty(entityId: 7, propertyId: 21, obxType: 1);
  static final plantTypeID =
      QueryIntegerProperty(entityId: 7, propertyId: 22, obxType: 6);
}

class TranslationWithFlowersColor_ {
  static final id =
      QueryIntegerProperty(entityId: 8, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 8, propertyId: 2, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 8, propertyId: 3, obxType: 6);
}

class TranslationWithFruitsColor_ {
  static final id =
      QueryIntegerProperty(entityId: 9, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 9, propertyId: 2, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 9, propertyId: 3, obxType: 6);
}

class TranslationWithLeafsColor_ {
  static final id =
      QueryIntegerProperty(entityId: 10, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 10, propertyId: 2, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 10, propertyId: 3, obxType: 6);
}

class TranslationWithMonths_ {
  static final id =
      QueryIntegerProperty(entityId: 11, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 11, propertyId: 2, obxType: 6);
  static final monthNumber =
      QueryIntegerProperty(entityId: 11, propertyId: 3, obxType: 6);
}

class TranslationWithNeedlesColor_ {
  static final id =
      QueryIntegerProperty(entityId: 12, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 12, propertyId: 2, obxType: 6);
  static final colorID =
      QueryIntegerProperty(entityId: 12, propertyId: 3, obxType: 6);
}

class TranslationWithPlantType_ {
  static final id =
      QueryIntegerProperty(entityId: 13, propertyId: 1, obxType: 6);
  static final translationID =
      QueryIntegerProperty(entityId: 13, propertyId: 2, obxType: 6);
  static final plantTypeID =
      QueryIntegerProperty(entityId: 13, propertyId: 3, obxType: 6);
}
