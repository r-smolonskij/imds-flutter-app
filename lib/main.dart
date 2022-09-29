import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterTestApp/db/translation_inserts.dart';
import 'package:flutterTestApp/db/translations_plantTypes_inserts.dart';
import 'package:flutterTestApp/db/translations_leafsColors_inserts.dart';
import 'package:flutterTestApp/db/translations_flowerColors_inserts.dart';
import 'package:flutterTestApp/db/translations_needlesColors_inserts.dart';
import 'package:flutterTestApp/db/translations_colors_inserts.dart';
import 'package:flutterTestApp/db/colors_inserts.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/objectbox.g.dart';

// import 'package:flutterTestApp/objectbox.g.dart';

import 'dart:async';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/SearchScreen.dart';
import 'db/globals.dart' as globals;

void main() {
  runApp(MyApp());

  // TranslationInserts translationsInserts = TranslationInserts();
  // // colorsInserts.addInserts();
  // // translationsColorsInserts.addAllInserts();
  // // translationsInserts.addPlantTypes();
  // translationsInserts.cleanAllInserts();
  // translationsInserts.addInserts();
  // // translationWithPlantTypesInserts.addInserts();
  // pathProvider.getApplicationDocumentsDirectory().then((Directory dir) {
  //   var _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
  //   var transBox = _store.box<Translation>();
  //   print("transBox on top");
  // });

  // // colorsInserts.cleanAllInserts();
  // // colorsInserts.addInserts();

  // // translationsInserts.clearAllTranslationsWithPlantTypes();
  // // translationsInserts.addPlantTypes();
  // // translationsInserts.cleanAllInserts();
  // // translationsInserts.addInserts();
  // // TranslationWithPlantTypesInserts translationWithPlantTypesInserts =
  // //     TranslationWithPlantTypesInserts();

  // // // translationsInserts.cleanAllInserts();
  // // translationsInserts.addInserts();
  // // globals.addWords();
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale("lv", "LV");
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale("en", "US"),
        Locale("lv", "LV"),
        Locale("de", "DE"),
        Locale("ru", "RU"),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: SearchScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
