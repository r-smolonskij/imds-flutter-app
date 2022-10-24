import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';

class MonthDropdownButton extends StatefulWidget {
  MonthDropdownButton(
      {this.hintText, this.onChange, this.selectedMonthId, this.isDisabled});

  final String hintText;
  final int selectedMonthId;
  final Function onChange;
  final bool isDisabled;

  @override
  State<MonthDropdownButton> createState() => _MonthDropdownButtonState();
}

class _MonthDropdownButtonState extends State<MonthDropdownButton> {
  int selectedMonth;

  @override
  void initState() {
    if (widget.selectedMonthId != null) {
      setState(() {
        selectedMonth = widget.selectedMonthId;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedMonthItem = monthsList
        .firstWhere((item) => item["id"] == selectedMonth, orElse: () => null);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: widget.isDisabled != null &&
              widget.isDisabled &&
              selectedMonthItem != null
          ? Container(
              child: Text(
                "${selectedMonthItem['number']}.${getTranslation(context, selectedMonthItem['month_translation'])}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )
          : DropdownButton(
              isExpanded: true,
              isDense: true,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              hint: Text(widget.hintText != null
                  ? widget.hintText
                  : getTranslation(context, "select_month")),
              value: selectedMonth,
              onChanged: (newValue) {
                setState(() {
                  selectedMonth = newValue;
                });
                widget.onChange(newValue);
              },
              items: monthsList.map((month) {
                return DropdownMenuItem(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${month['number']}.${getTranslation(context, month['month_translation'])}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  value: month["id"],
                );
              }).toList(),
            ),
    );
  }
}
