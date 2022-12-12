import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpansionItem extends StatefulWidget {
  const ExpansionItem(
      {Key key, this.title, this.description, this.urlMask, this.url})
      : super(key: key);
  final String title, description, urlMask, url;
  @override
  State<ExpansionItem> createState() => _ExpansionItemState();
}

class _ExpansionItemState extends State<ExpansionItem> {
  var isOpen = false;

  Future<void> launchInBrowser() async {
    if (await canLaunch(widget.url)) {
      await launch(
        widget.url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $widget.url';
    }
  }

  changeState() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeState(),
      child: Container(
        decoration: BoxDecoration(
          gradient: kDefaultLinearGradient,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.title}",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    isOpen ? Icons.arrow_circle_up : Icons.arrow_circle_down,
                    size: 28,
                  )
                ],
              ),
            ),
            isOpen
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        Text(
                          "${widget.description}",
                          style: TextStyle(fontSize: 18),
                        ),
                        widget.url != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: GestureDetector(
                                    onTap: () => launchInBrowser(),
                                    child: Text(
                                        widget.urlMask != null
                                            ? "${widget.urlMask}"
                                            : "URL Link",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
