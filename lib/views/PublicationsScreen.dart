import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/PublicationListItem.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';

class PublicationsScreen extends StatefulWidget {
  @override
  _PublicationsScreenState createState() => _PublicationsScreenState();
}

class _PublicationsScreenState extends State<PublicationsScreen> {
  Future<bool> check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    check();
    var size = MediaQuery.of(context).size;
    return DefaultView(
      title: AppLocalizations.of(context).translate("publications").toString(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PublicationsList(
              publicationsList: publicationsList,
            ),
            // FlatButton(onPressed: AppLocalizations., child: Text("Click me"))
          ],
        ),
      ),
    );
  }
}

class PublicationsList extends StatelessWidget {
  const PublicationsList({Key key, this.publicationsList}) : super(key: key);

  final List publicationsList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: publicationsList
          .map((publication) => PublicationListItem(
              description:
                  "${publicationsList.indexOf(publication) + 1}. ${publication["text"]}",
              linksList: publication["links"]))
          .toList(),
    ));
  }
}
