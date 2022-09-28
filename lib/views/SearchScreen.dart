import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutterTestApp/db/translation_inserts.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spell_checker/spell_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/components/SearchResultsListItem.dart';
import '../db/globals.dart' as globals;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchText = "";
  var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var searchBoxText = TextEditingController();
  var checker = new SingleWordSpellChecker(distance: 1.0);
  Store _store;
  var box, transBox;
  TranslationInserts inserts = TranslationInserts();

  @override
  void initState() {
    // getApplicationDocumentsDirectory().then((Directory dir) {
    //   _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    //   transBox = _store.box<Translation>();
    //   print("transBox");
    // });

    super.initState();
  }

  _setSearchText(value) {
    setState(() {
      searchText = value;
    });
  }

//Verry Important _objectBoxView()
  Widget _objectBoxView() {
    var searchQueryLA = transBox
        .query(Translation_.la
            .contains(searchText.trim())
            .and(Translation_.showLA.equals(true)))
        .build();
    var searchQueryLV = transBox
        .query(Translation_.lv
            .contains(searchText.trim())
            .and(Translation_.showLV.equals(true)))
        .build();
    var searchQueryEN = transBox
        .query(Translation_.en
            .contains(searchText.trim())
            .and(Translation_.showEN.equals(true)))
        .build();
    var searchQueryDE = transBox
        .query(Translation_.de
            .contains(searchText.trim())
            .and(Translation_.showDE.equals(true)))
        .build();
    var searchQueryRU = transBox
        .query(Translation_.ru
            .contains(searchText.trim())
            .and(Translation_.showRU.equals(true)))
        .build();

    var listLA = [], listLV = [], listEN = [], listDE = [], listRU = [];
    if (searchQueryLA.count() > 0) {
      var tempList = searchQueryLA.find();
      for (var i = 0; i < tempList.length; i++) {
        var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);
        listLA.add([firstVal.la, firstVal.id, 'la']);
      }
    }

    if (searchQueryLV.count() > 0) {
      var tempList = searchQueryLV.find();
      for (var i = 0; i < tempList.length; i++) {
        var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);
        listLV.add([firstVal.lv, firstVal.id, 'lv']);
      }
    }
    if (searchQueryEN.count() > 0) {
      var tempList = searchQueryEN.find();
      for (var i = 0; i < tempList.length; i++) {
        var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);
        listEN.add([firstVal.en, firstVal.id, 'en']);
      }
    }
    if (searchQueryDE.count() > 0) {
      var tempList = searchQueryDE.find();
      for (var i = 0; i < tempList.length; i++) {
        var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);

        listDE.add([firstVal.de, firstVal.id, 'de']);
      }
    }
    if (searchQueryRU.count() > 0) {
      var tempList = searchQueryRU.find();
      for (var i = 0; i < tempList.length; i++) {
        var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);
        listRU.add([firstVal.ru, firstVal.id, 'ru']);
      }
    }
    List list = listLA + listLV + listEN + listDE + listRU;
    if (searchQueryLA.count() +
            searchQueryLV.count() +
            searchQueryEN.count() +
            searchQueryDE.count() +
            searchQueryRU.count() ==
        0) {
      List matches = globals.globalWordsChecker.find(searchText.trim());
      print("matches = " + matches.toString());
      var tempList = [];
      for (var i = 0; i < matches.length; i++) {
        var queryLA = transBox
            .query(Translation_.la
                .equals(matches[i].word)
                .and(Translation_.showLA.equals(true)))
            .build();
        var queryLV = transBox
            .query(Translation_.lv
                .equals(matches[i].word)
                .and(Translation_.showLV.equals(true)))
            .build();
        var queryEN = transBox
            .query(Translation_.en
                .equals(matches[i].word)
                .and(Translation_.showEN.equals(true)))
            .build();
        var queryDE = transBox
            .query(Translation_.de
                .equals(matches[i].word)
                .and(Translation_.showDE.equals(true)))
            .build();
        var queryRU = transBox
            .query(Translation_.ru
                .equals(matches[i].word)
                .and(Translation_.showRU.equals(true)))
            .build();

        if (queryLA.count() > 0) {
          var localTempList = queryLA.find();
          localTempList.map((e) {
            tempList.add([e.la, e.id, 'la']);
          }).toList();
        }

        // if (queryLV.count() > 0) {
        //   var tempList = queryLV.find();
        //   for (var i = 0; i < tempList.length; i++) {
        //     var firstVal = tempList.firstWhere((e) => e.id == tempList[i].id);
        //     // tempList.add([firstVal.lv, firstVal.id, 'lv']);
        //   }
        // }
        if (queryLV.count() > 0) {
          var localTempList = queryLV.find();
          localTempList.map((e) {
            tempList.add([e.lv, e.id, 'lv']);
          }).toList();
        }
        if (queryEN.count() > 0) {
          var localTempList = queryEN.find();
          localTempList.map((e) {
            tempList.add([e.en, e.id, 'en']);
          }).toList();
        }
        if (queryDE.count() > 0) {
          var localTempList = queryDE.find();
          localTempList.map((e) {
            tempList.add([e.de, e.id, 'de']);
          }).toList();
        }
        if (queryRU.count() > 0) {
          var localTempList = queryRU.find();
          localTempList.map((e) {
            tempList.add([e.ru, e.id, 'ru']);
          }).toList();
        }
        // query = transBox
        //     .query((Translation_.la
        //             .equals(matches[i].word)
        //             .and(Translation_.showLA.equals(true)))
        //         .or(Translation_.lv
        //             .equals(matches[i].word)
        //             .and(Translation_.showLV.equals(true)))
        //         .or(Translation_.en
        //             .equals(matches[i].word)
        //             .and(Translation_.showEN.equals(true)))
        //         .or(Translation_.de
        //             .equals(matches[i].word)
        //             .and(Translation_.showDE.equals(true)))
        //         .or(Translation_.ru
        //             .equals(matches[i].word)
        //             .and(Translation_.showRU.equals(true))))
        //     .build();

        // var foundList = query.find();
        // for (var j = 0; j < foundList.length; j++) {
        //   print([matches[i].word, foundList[j].id]);
        //   tempList.add([matches[i].word, foundList[j].id]);
        // }
      }
      list = tempList;
    }

    return list.length == 0
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Netika atrasts neviens termins pēc Jūsu ievadītā teksta",
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
                      'Atjaunot meklēšanas lauku',
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
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SearchResultsListItem(
                title: list[index][0],
                translationWordID: list[index][1],
                language: list[index][2],
              );
            });
  }

  // Widget _buildListView() {
  //   return WatchBoxBuilder(
  //     box: Hive.box('translations'),
  //     builder: (context, translationsBox) {
  //       return ListView.builder(
  //         itemCount: translationsBox.length,
  //         itemBuilder: (context, index) {
  //           final translation = translationsBox.getAt(index) as Translation;
  //           print(index);
  //           if (translation.translation
  //               .toLowerCase()
  //               .contains(searchText.toLowerCase())) {
  //             return SearchResultsListItem(
  //               title: translation.translation + " " + searchText.toLowerCase(),
  //             );
  //           } else {
  //             return SizedBox(
  //               height: 0,
  //             );
  //           }
  //         },
  //       );
  //     },
  //   );
  // }

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
                // keyboardType: TextInputType.multiline,
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
