import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterTestApp/constants.dart';

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
