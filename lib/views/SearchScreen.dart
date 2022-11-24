import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutterTestApp/db/globals.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/components/SearchResultsListItem.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchText = "";
  bool isSearching = false;
  var searchBoxText = TextEditingController();
  List translationItems = [];
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
  }

  _setSearchText(value) async {
    setState(() {
      searchText = value;
    });
    if (value.length > 2) {
      isSearching = true;
      var itemsList = [];

      for (var lang in languages) {
        dbHelper
            .getTranslationByLanguageAndSearchText(searchText.trim(), lang)
            .then((translations) {
          translations.forEach((translation) {
            var item = {
              "translation": translation,
              "translationId": translation.id,
              "language": lang,
              "displayedTitle": lang == "lv"
                  ? translation.lv
                  : lang == "en"
                      ? translation.en
                      : lang == "de"
                          ? translation.de
                          : lang == "ru"
                              ? translation.ru
                              : translation.la
            };
            var dontShowLatvian = lang == "lv" &&
                translation.lv_prio != null &&
                translation.lv_prio > 1;
            var dontShowGerman = lang == "de" &&
                translation.de_prio != null &&
                translation.de_prio > 1;
            var dontShowRussian = lang == "ru" &&
                translation.ru_prio != null &&
                translation.ru_prio > 1;
            if (!dontShowLatvian && !dontShowGerman && !dontShowRussian) {
              itemsList.add(item);
            }
          });
        });
        await Future.delayed(const Duration(milliseconds: 50));
      }
      if (itemsList.length == 0) {
        List matches = globalWordsChecker.find(searchText.trim());
        for (var i = 0; i < matches.length; i++) {
          languages.forEach((lang) {
            dbHelper
                .getTranslationByLanguageAndSearchText(matches[i].word, lang)
                .then((translations) {
              translations.forEach((translation) {
                var item = {
                  "translation": translation,
                  "translationId": translation.id,
                  "language": lang,
                  "displayedTitle": lang == "lv"
                      ? translation.lv
                      : lang == "en"
                          ? translation.en
                          : lang == "de"
                              ? translation.de
                              : lang == "ru"
                                  ? translation.ru
                                  : translation.la
                };
                var dontShowLatvian = lang == "lv" &&
                    translation.lv_prio != null &&
                    translation.lv_prio > 1;
                var dontShowGerman = lang == "de" &&
                    translation.de_prio != null &&
                    translation.de_prio > 1;
                var dontShowRussian = lang == "ru" &&
                    translation.ru_prio != null &&
                    translation.ru_prio > 1;
                if (!dontShowLatvian && !dontShowGerman && !dontShowRussian) {
                  itemsList.add(item);
                }
              });
            });
          });
          await Future.delayed(const Duration(milliseconds: 50));
        }
      }

      setState(() {
        translationItems = itemsList;
        isSearching = false;
      });
    }
  }

  Widget _objectBoxView() {
    return isSearching
        ? Container(child: Center(child: CircularProgressIndicator()))
        : !translationItems.isNotEmpty
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getTranslation(context, "no_results_found_by_filters"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: FlatButton(
                        height: 45,
                        child: Text(
                          getTranslation(context, "clear_search_field"),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFC2BE66),
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white, width: 2)),
                        onPressed: () {
                          searchBoxText.clear();
                          _setSearchText("");
                        },
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: translationItems.length,
                itemBuilder: (context, index) {
                  return SearchResultsListItem(
                      title: translationItems[index]["displayedTitle"],
                      translationWordID: translationItems[index]
                          ["translationId"],
                      language: translationItems[index]["language"]);
                });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: AppLocalizations.of(context).translate("search").toString(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                autocorrect: true,
                minLines: 1,
                maxLines: 2,
                controller: searchBoxText,
                onChanged: (value) => _setSearchText(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: kDefaultColor,
                  ),
                  suffixIcon: searchText != ""
                      ? GestureDetector(
                          onTap: () {
                            searchBoxText.clear();
                            _setSearchText("");
                          },
                          child:
                              Icon(Icons.cancel_outlined, color: kDefaultColor),
                        )
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  fillColor: kDefaultColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kDefaultColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: kDefaultColor)),
                ),
              ),
            ),
            searchText.trim().length < 3
                ? Container(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.25, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .translate("enter_3_symbols")
                              .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kDefaultColor),
                        ),
                      ],
                    ),
                  )
                : SizedBox(height: 0),
            searchText.length >= 3
                ? Container(
                    // padding: EdgeInsets.only(bottom: 80),
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).padding.top -
                        AppBar().preferredSize.height -
                        40 -
                        80 -
                        40,
                    child: _objectBoxView(),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
