import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Games/MonthDropdownButton.dart';
import 'package:flutterTestApp/components/Loader.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({Key key}) : super(key: key);

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int selectedMonthId;
  int selectedTip = 0;
  bool loading = false;
  DateTime now = DateTime.now();

  changeMonth(monthId) {
    setState(() {
      selectedMonthId = monthId;
      selectedTip = 0;
    });
  }

  changeTip({goToPrevious = false}) async {
    var selectedMonth = tipsByMonth.firstWhere(
        (month) => month["monthId"] == selectedMonthId,
        orElse: () => null);
    var tips =
        selectedMonth != null ? selectedMonth["tips"] as List<String> : null;
    setState(() {
      loading = true;
    });
    var isLastTipAtCurrentMonth = selectedTip == tips.length - 1;
    var isFirstTip = selectedTip == 0;
    if (isLastTipAtCurrentMonth && !goToPrevious) {
      changeMonth(selectedMonthId == 12 ? 1 : selectedMonthId + 1);
    } else if (isFirstTip && goToPrevious) {
      changeMonth(selectedMonthId == 1 ? 12 : selectedMonthId - 1);
    } else {
      setState(() {
        selectedTip = goToPrevious ? selectedTip - 1 : selectedTip + 1;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    changeMonth(now.month);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedMonth = tipsByMonth.firstWhere(
        (month) => month["monthId"] == selectedMonthId,
        orElse: () => null);
    var tips =
        selectedMonth != null ? selectedMonth["tips"] as List<String> : null;
    return DefaultView(
      title: getTranslation(context, "tips"),
      goBack: true,
      child: loading || tips == null
          ? Loader()
          : Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  MonthDropdownButton(
                    selectedMonthId: selectedMonthId,
                    onChange: (monthId) => changeMonth(monthId),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => changeTip(goToPrevious: true),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Icon(Icons.keyboard_arrow_left_outlined,
                                size: 28, color: kDefaultColor),
                          ),
                        ),
                        Text(
                          "${selectedTip + 1} ${getTranslation(context, "of")} ${tips.length}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kDefaultColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () => changeTip(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Icon(Icons.keyboard_arrow_right_outlined,
                                size: 28, color: kDefaultColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    tips[selectedTip],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
    );
  }
}
