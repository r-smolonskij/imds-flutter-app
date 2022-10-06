import 'package:flutter/material.dart';

class MonthSelectionItem extends StatefulWidget {
  const MonthSelectionItem({
    Key key,
    this.monthRoman,
    this.monthTitle,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  final String monthRoman;
  final String monthTitle;
  final Function onTap;
  final bool isSelected;

  @override
  _MonthSelectionItemState createState() => _MonthSelectionItemState();
}

class _MonthSelectionItemState extends State<MonthSelectionItem> {
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
    return GestureDetector(
      onTap: () {
        widget.onTap();
        changeSelectionState();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          color: Color(0x00FFFFFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "${widget.monthRoman}. ${widget.monthTitle}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
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
      ),
    );
  }
}
