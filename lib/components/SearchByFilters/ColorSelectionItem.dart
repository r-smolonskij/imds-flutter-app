import 'package:flutter/material.dart';

class ColorSelectionItem extends StatefulWidget {
  const ColorSelectionItem(
      {Key key, this.color, this.colorTitle, this.isSelected, this.onSelection})
      : super(key: key);

  final String color;
  final String colorTitle;
  final bool isSelected;
  final Function onSelection;
  @override
  _ColorSelectionItemState createState() => _ColorSelectionItemState();
}

class _ColorSelectionItemState extends State<ColorSelectionItem> {
  var localIsSelected;
  @override
  void initState() {
    setState(() {
      localIsSelected = widget.isSelected;
    });
    super.initState();
  }

  void changeSelectionState() {
    setState(() {
      localIsSelected = !localIsSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return GestureDetector(
      onTap: () {
        widget.onSelection();
        changeSelectionState();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      height: 25,
                      width: 25,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: hexToColor("#" + widget.color),
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.colorTitle,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              localIsSelected
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
