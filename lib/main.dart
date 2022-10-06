import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/SearchScreen.dart';
import 'db/globals.dart' as globals;

void main() {
  runApp(MyApp());
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
  var db;
  var loading = false;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void initState() {
    getData();
  }

  getData() async {
    loading = true;
    await globals.addWords();
    setState(() {
      loading = false;
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
      home: loading ? SizedBox() : SearchScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
