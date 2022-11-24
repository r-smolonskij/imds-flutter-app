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
                  "Sviķe, S., 2018. A New Dictionary of Botanical Terms: Data Analysis of a Lexicographic Survey. Economics World. New York: David Publishing Company Journal. May-June 2018, 6 (3). 228–241.",
                  [
                    "http://www.davidpublisher.com/index.php/Home/Article/index?id=35063.html"
                  ]
                ],
                [
                  "Sviķe, S., 2017. A New Dictionary of Botanical Terms: an Insight into the Compilation Project of the Dictionary. Jeļena Titko (ed) Emerging Trends in Economics, Culture and Humanities (etECH2017). Conference Proceedings. Rīga: Ekonomikas un kultūras augstskola, 22–30.",
                  ["https://www.augstskola.lv/upload/Conf_proceedings_2017.pdf"]
                ],
                [
                  "Stalažs, A., 2015. Asteru, miķelīšu, ziemasteru un dažu citu radniecīgo ģinšu sugu latviskie nosaukumi. Scripta Letonica 2(1). Dobele: RPD Science. 24–30.",
                  [
                    "http://www.rpd-science.org/ScrLet/V002/Scripta_Letonica_2-1_2015_Art_4.pdf",
                  ]
                ],
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
