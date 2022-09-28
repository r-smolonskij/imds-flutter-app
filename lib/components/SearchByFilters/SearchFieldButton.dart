import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';

class SearchFieldButton extends StatefulWidget {
  const SearchFieldButton(
      {Key key,
      this.title,
      this.dialogFunction,
      this.resultsList,
      this.colorsList,
      this.monthsText,
      this.selectedType})
      : super(key: key);
  final String title, monthsText;
  final Function dialogFunction;
  final List resultsList, colorsList;
  final dynamic selectedType;
  @override
  _SearchFieldButtonState createState() => _SearchFieldButtonState();
}

class _SearchFieldButtonState extends State<SearchFieldButton> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  void initState() {
    print(widget.selectedType);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () => widget.dialogFunction(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          constraints: BoxConstraints(minHeight: 50),
          decoration: BoxDecoration(gradient: kDefaultLinearGradient),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    widget.selectedType != null
                        ? Text(
                            widget.selectedType[1].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    widget.monthsText != null
                        ? Text(
                            widget.monthsText,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        : SizedBox(),
                    widget.colorsList != null
                        ? Wrap(
                            children: widget.colorsList.map((e) {
                              if (e[3]) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, bottom: 2),
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: hexToColor("#" + e[2]),
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            }).toList(),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
