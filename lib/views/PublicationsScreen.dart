import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
              publicationsList: [
                [
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambl",
                  [
                    "https://www.lipsum.com/",
                    "http://www.lingoes.net/en/translator/langcode.htm"
                  ]
                ],
                [
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambl",
                  [
                    "https://www.lipsum.com/",
                    "http://www.lingoes.net/en/translator/langcode.htm"
                  ]
                ],
                [
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambl",
                  [
                    "https://www.lipsum.com/",
                    "http://www.lingoes.net/en/translator/langcode.htm"
                  ]
                ],
                [
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambl",
                  [
                    "https://www.lipsum.com/",
                    "http://www.lingoes.net/en/translator/langcode.htm"
                  ]
                ]
                // "Lorem Ipsum is simply dummy text of t",
                // ["111", "john"],

                //   description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                //     linksList: [
                //       "https://www.lipsum.com/",
                //       "http://www.lingoes.net/en/translator/langcode.htm"
                // },
              ],
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
    List linksList = [];
    var counter = 1;
    return Container(
      child: publicationsList != null
          ? Column(
              children:
                  // for (var item in publicationsList)
                  //   PublicationListItem(
                  //     description: "." + [0].toString(),
                  //     linksList: item[1],
                  //   )
                  publicationsList
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          PublicationListItem(
                            description: (key + 1).toString() + ". " + value[0],
                            linksList: value[1],
                          ),
                        ),
                      )
                      .values
                      .toList(),
            )
          : SizedBox(),
    );
  }
}

class PublicationListItem extends StatefulWidget {
  const PublicationListItem({
    Key key,
    this.description,
    this.linksList,
  }) : super(key: key);

  final String description;
  final List linksList;
  @override
  _PublicationListItemState createState() => _PublicationListItemState();
}

class _PublicationListItemState extends State<PublicationListItem> {
  Future<void> _launched;
  String _phone = '';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description != null ? widget.description : "",
            style: TextStyle(fontSize: 18),
          ),
          if (widget.linksList != null) SizedBox(height: 10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.linksList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(e);
                          });
                        },
                        child: Text(
                          e.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kDefaultColor,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
