import 'package:flutter/material.dart';
import 'package:flutterTestApp/sqlite/translation.dart';
import 'package:flutterTestApp/views/SemanticSearch/SemanticTreeScreen.dart';
import 'package:flutterTestApp/constants.dart';

class SemanticSearchResultsListItem extends StatelessWidget {
  const SemanticSearchResultsListItem({Key key, this.translation})
      : super(key: key);
  final Translation translation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SemanticTreeScreen(
                translation: translation,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            border: Border.all(color: kDefaultColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //width is needed if you have icon at right side
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  translation.la,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kDefaultColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
