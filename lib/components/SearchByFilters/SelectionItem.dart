import 'package:flutter/material.dart';

class SelectionItem extends StatefulWidget {
  const SelectionItem(
      {Key key,
      this.id,
      this.title,
      this.isSelected,
      this.imagePath,
      this.onPress})
      : super(key: key);
  final String title, imagePath;
  final int id;
  final bool isSelected;
  final Function onPress;

  @override
  _SelectionItemState createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        Navigator.of(context).pop();
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
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Image.asset(
                        "assets/images/piktogrammas/${widget.imagePath}",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title != null ? widget.title : "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              widget.isSelected
                  ? Icons.check_circle_outline_outlined
                  : Icons.radio_button_off,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
