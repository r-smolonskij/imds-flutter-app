import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class UsedSourcesScreen extends StatefulWidget {
  @override
  _UsedSourcesScreenState createState() => _UsedSourcesScreenState();
}

class _UsedSourcesScreenState extends State<UsedSourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: AppLocalizations.of(context).translate("used_sources").toString(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SourceList(
              listTitle: getTranslation(context, "used_sources"),
              sourcesList: sourcesList,
            ),
            SourceList(
              titleWidth: 30,
              authorWidth: 80,
              listTitle: getTranslation(context, "used_sources_from_net"),
              sourcesList: internetSourcesList,
              isUrlLink: true,
            ),
          ],
        ),
      ),
    );
  }
}

class SourceItem extends StatefulWidget {
  const SourceItem({
    Key key,
    this.sourceTitle,
    this.sourceAuthor,
    this.sourceUrl,
    this.titleWidth,
    this.authorWidth,
  }) : super(key: key);
  final String sourceTitle, sourceAuthor, sourceUrl;
  final int titleWidth, authorWidth;

  @override
  _SourceItemState createState() => _SourceItemState();
}

class _SourceItemState extends State<SourceItem> {
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
      // throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(),
      //   ),
      // ),
      child: Row(
        children: [
          Expanded(
            flex: widget.titleWidth != null ? widget.titleWidth : 38,
            child: Text(
              widget.sourceTitle != null ? widget.sourceTitle : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              flex: widget.authorWidth != null && widget.titleWidth != null
                  ? ((widget.authorWidth + widget.titleWidth) / 100 * 2).toInt()
                  : 2,
              child: SizedBox()),
          Expanded(
            flex: widget.authorWidth != null ? widget.authorWidth : 60,
            child: GestureDetector(
              onTap: widget.sourceUrl != null
                  ? () {
                      setState(() {
                        _launched = _launchInBrowser(widget.sourceUrl);
                      });
                    }
                  : () {},
              child: Text(
                widget.sourceAuthor != null ? widget.sourceAuthor : "",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.sourceUrl != null ? Colors.blue : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SourceList extends StatelessWidget {
  const SourceList(
      {Key key,
      this.listTitle,
      this.sourcesList,
      this.titleWidth,
      this.authorWidth,
      this.isUrlLink})
      : super(key: key);
  final String listTitle;
  final List sourcesList;
  final int titleWidth, authorWidth;
  final bool isUrlLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Text(
          listTitle != null ? listTitle : "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        for (var item in sourcesList)
          SourceItem(
            sourceTitle: item[0].toString(),
            sourceAuthor: item[1].toString(),
            sourceUrl:
                isUrlLink != null && isUrlLink ? item[1].toString() : null,
            titleWidth: titleWidth != null ? titleWidth : null,
            authorWidth: authorWidth != null ? authorWidth : null,
          )
        // sourcesList
        //     .map(
        //       (e) => SourceItem(
        //         sourceTitle: e[0].toString(),
        //         sourceAuthor: e[1].toString(),
        //       ),
        //     )
        //     .toList(),
      ]),
    );
  }
}
