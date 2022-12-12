import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/SemanticSearchResultsListItem.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';

class SemanticSearchScreen extends StatefulWidget {
  const SemanticSearchScreen({Key key}) : super(key: key);

  @override
  State<SemanticSearchScreen> createState() => _SemanticSearchScreenState();
}

class _SemanticSearchScreenState extends State<SemanticSearchScreen> {
  var searchBoxTextController = TextEditingController();
  String searchText = "";
  DatabaseHelper dbHelper = DatabaseHelper();
  var translationItems = [];

  _setSearchText(text) {
    setState(() {
      searchText = text;
    });
    if (text.length > 2) {
      dbHelper
          .getSemanticSearchTranslations(searchText.trim())
          .then((translations) {
        var itemsList = [];
        translations.forEach((translation) {
          itemsList.add(translation);
        });
        setState(() {
          translationItems = itemsList;
        });
      });
    }
  }

  Widget _objectBoxView() {
    return !translationItems.isNotEmpty
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
                      searchBoxTextController.clear();
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
              return SemanticSearchResultsListItem(
                  translation: translationItems[index]);
            });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: getTranslation(context, "semantic_search"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              autocorrect: true,
              minLines: 1,
              maxLines: 2,
              controller: searchBoxTextController,
              onChanged: (value) => _setSearchText(value),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kDefaultColor,
                ),
                suffixIcon: searchText != ""
                    ? GestureDetector(
                        onTap: () {
                          searchBoxTextController.clear();
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
                        getTranslation(context, "enter_3_symbols"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kDefaultColor),
                      ),
                    ],
                  ),
                )
              : Container(
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
        ]),
      ),
    );
  }
}
