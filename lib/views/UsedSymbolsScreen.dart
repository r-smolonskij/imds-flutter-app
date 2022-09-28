import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';

class UsedSymbolsScreen extends StatefulWidget {
  @override
  _UsedSymbolsScreenState createState() => _UsedSymbolsScreenState();
}

class _UsedSymbolsScreenState extends State<UsedSymbolsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: AppLocalizations.of(context).translate("used_symbols").toString(),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(children: [
                Flexible(
                  child: Text(
                    "To be able to see all table's content please scroll right and down ➡️ ⬆️",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomTable2(
                dataRows: [
                  [
                    1,
                    2,
                    AppLocalizations.of(context)
                        .translate("used_symbols")
                        .toString()
                  ]
                ],
              ),
              // CustomTable(
              //   headerRow: [
              //     AppLocalizations.of(context).translate("symbol").toString(),
              //     AppLocalizations.of(context).translate("latin").toString(),
              //     AppLocalizations.of(context).locale.toString() == "en_US"
              //         ? AppLocalizations.of(context)
              //             .translate("english")
              //             .toString()
              //         : AppLocalizations.of(context).locale.toString() ==
              //                 "lv_LV"
              //             ? AppLocalizations.of(context)
              //                 .translate("latvian")
              //                 .toString()
              //             : AppLocalizations.of(context).locale.toString() ==
              //                     "ru_RU"
              //                 ? AppLocalizations.of(context)
              //                     .translate("russian")
              //                     .toString()
              //                 : AppLocalizations.of(context)
              //                     .translate("german")
              //                     .toString()
              //     // AppLocalizations.of(context).locale.toString() == "EN_en"
              //     //     ? AppLocalizations.of(context)
              //     //         .translate("english")
              //     //         .toString()
              //     //     : null,
              //     // AppLocalizations.of(context).translate("latvian").toString(),
              //     // AppLocalizations.of(context).locale.toString() == "EN_en"
              //     //     ? AppLocalizations.of(context)
              //     //         .translate("german")
              //     //         .toString()
              //     //     : null,
              //     // AppLocalizations.of(context).locale.toString() == "EN_en"
              //     //     ? AppLocalizations.of(context)
              //     //         .translate("russian")
              //     //         .toString()
              //     //     : null
              //   ],
              //   dataRows: [
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //     [1, 2, 2],
              //     [3, 4, 3],
              //     [5, 6, 3],
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTable2 extends StatelessWidget {
  const CustomTable2({
    Key key,
    this.dataRows,
  }) : super(key: key);

  final List dataRows;

  @override
  Widget build(BuildContext context) {
    var outputList = [];
    outputList.length = 1;
    outputList[0] = new List.from([
      AppLocalizations.of(context).translate("symbol").toString(),
      AppLocalizations.of(context).translate("latin").toString(),
      AppLocalizations.of(context).locale.toString() == "en_US"
          ? AppLocalizations.of(context).translate("english").toString()
          : AppLocalizations.of(context).locale.toString() == "lv_LV"
              ? AppLocalizations.of(context).translate("latvian").toString()
              : AppLocalizations.of(context).locale.toString() == "ru_RU"
                  ? AppLocalizations.of(context).translate("russian").toString()
                  : AppLocalizations.of(context).translate("german").toString()
    ]);
    outputList.addAll(dataRows);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        columnWidths: {
          0: IntrinsicColumnWidth(),
        },
        defaultColumnWidth:
            FixedColumnWidth(MediaQuery.of(context).size.width / 3 + 30),
        border: TableBorder.all(
          color: kDefaultColor,
        ),
        children: outputList
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                TableRow(
                  decoration:
                      BoxDecoration(color: key == 0 ? kDefaultColor : null),
                  children: value
                      .map<TableCell>(
                        (sEl) => TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                sEl.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: key == 0
                                      ? kSecondaryColor
                                      : kDefaultColor,
                                  fontSize: key == 0 ? 24 : 22,
                                  fontWeight: key == 0
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

class CustomTable extends StatelessWidget {
  const CustomTable({
    Key key,
    this.headerRow,
    this.dataRows,
  }) : super(key: key);

  final List headerRow;
  final List dataRows;

  @override
  Widget build(BuildContext context) {
    var outputList = [];
    outputList.length = 1;
    outputList[0] = new List.from(headerRow);
    outputList.addAll(dataRows);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        columnWidths: {
          0: IntrinsicColumnWidth(),
        },
        defaultColumnWidth: headerRow.length > 3
            ? FixedColumnWidth(MediaQuery.of(context).size.width / 3 + 30)
            : FixedColumnWidth(
                MediaQuery.of(context).size.width / headerRow.length - 20),
        border: TableBorder.all(
          color: kDefaultColor,
        ),
        children: outputList
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                TableRow(
                  decoration:
                      BoxDecoration(color: key == 0 ? kDefaultColor : null),
                  children: value
                      .map<TableCell>(
                        (sEl) => TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                sEl.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: key == 0
                                      ? kSecondaryColor
                                      : kDefaultColor,
                                  fontSize: key == 0 ? 24 : 22,
                                  fontWeight: key == 0
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .values
            .toList(),
      ),

      // TableRow(
      //   children: headerRow != null
      //       ? headerRow
      //           .map(
      //             (e) => TableCell(
      //               verticalAlignment: TableCellVerticalAlignment.middle,
      //               child: Center(
      //                 child: Text(
      //                   e.toString(),
      //                   style: TextStyle(fontSize: 30),
      //                 ),
      //               ),
      //             ),
      //           )
      //           .toList()
      //       : null,
      // ),
      // TableRow(
      //   children: [
      //     TableCell(
      //       child: Text("ss"),
      //     ),
      //     TableCell(
      //       child: Text("ss"),
      //     ),
      //   ],
      // )
    );
  }
}

// class CustomTable extends StatelessWidget {
//   const CustomTable({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           border: Border(
//             right: BorderSide(),
//           ),
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(),
//                         top: BorderSide(),
//                         right: BorderSide(),
//                         left: BorderSide()),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(),
//                         top: BorderSide(),
//                         right: BorderSide(),
//                         left: BorderSide()),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(),
//                         top: BorderSide(),
//                         right: BorderSide(),
//                         left: BorderSide()),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                       Text(
//                         "data",
//                         style: TextStyle(fontSize: 100),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
