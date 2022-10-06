import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetSource extends StatefulWidget {
  const InternetSource({
    Key key,
    this.sourceTitle,
    this.sourceUrl,
  }) : super(key: key);

  final String sourceTitle, sourceUrl;

  @override
  _InternetSourceState createState() => _InternetSourceState();
}

class _InternetSourceState extends State<InternetSource> {
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
    return widget.sourceUrl == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  "${widget.sourceTitle}: ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _launched = _launchInBrowser("${widget.sourceUrl}");
                      });
                    },
                    child: Text(
                      "${widget.sourceUrl}",
                      style: TextStyle(color: kDefaultColor, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
