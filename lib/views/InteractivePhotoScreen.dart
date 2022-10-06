import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/objectbox.g.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/views/SingleTranslationScreen.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class InteractivePhotoScreen extends StatelessWidget {
  const InteractivePhotoScreen(
      {Key key,
      this.title,
      this.imageTitle,
      this.imageWidth,
      this.imageHeight,
      this.pinsList,
      this.infoButton})
      : super(key: key);

  final String title, imageTitle;
  final double imageWidth, imageHeight;
  final List pinsList;
  final infoButton;
  @override
  Widget build(BuildContext context) {
    // var imageHeight = 1181.0, imageWidth = 1178.0;

    // var imageWidth = this.imageWidth > 800 ? this.imageWidth : 800.0;
    // var imageHeight = this.imageWidth > 800
    //     ? this.imageHeight
    //     : 800.0 * this.imageHeight / this.imageWidth;
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    var pinsList = this.pinsList != null ? this.pinsList : [];

    return DefaultView(
      title: title != null ? title : "",
      goBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    40 -
                    60 -
                    MediaQuery.of(context).padding.bottom -
                    MediaQuery.of(context).padding.top),
            width: MediaQuery.of(context).size.width - 40,
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  imageTitle != null
                      ? Image.asset(
                          "assets/interactive_images/${imageTitle}",
                          height: imageWidth > size.width
                              ? ((size.width - 40) * (imageHeight / imageWidth))
                              : imageHeight,
                          width: imageWidth > size.width
                              ? (size.width - 40)
                              : imageWidth,
                          fit: BoxFit.fill,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  // infoButton != null
                  //     ? Positioned(
                  //         bottom: 20,
                  //         right: 0,
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             var _store, transBox, translation;
                  //             getApplicationDocumentsDirectory()
                  //                 .then((Directory dir) {
                  //               _store = Store(getObjectBoxModel(),
                  //                   directory: dir.path + '/objectbox');
                  //               transBox = _store.box<Translation>();
                  //               var query = transBox
                  //                   .query(
                  //                       Translation_.id.equals(infoButton[2]))
                  //                   .build();
                  //               translation = query.find();
                  //             });
                  //             showDialog<void>(
                  //               context: context,
                  //               barrierDismissible:
                  //                   false, // user must tap button!
                  //               builder: (BuildContext context) {
                  //                 return DescriptionAlert(
                  //                   translation: translation[0],
                  //                 );
                  //               },
                  //             );
                  //           },
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //                 border:
                  //                     Border.all(color: Colors.black, width: 2),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //             // height: size.width * 0.2,
                  //             // width: infoButton.length == 4
                  //             //     ? infoButton[3]
                  //             //     : size.width * 0.25,
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: Icon(
                  //                     Icons.translate,
                  //                     size: size.width * 0.08,
                  //                   ),
                  //                 ),
                  //                 // Text(
                  //                 //   "Translations",
                  //                 //   textAlign: TextAlign.center,
                  //                 //   style:
                  //                 //       TextStyle(fontSize: size.width * 0.04),
                  //                 // )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox(height: 0),
                  for (var item in pinsList)
                    CustomPin(
                      imageWidth: imageWidth,
                      imageHeight: imageHeight,
                      size: size,
                      padding: padding,
                      fromLeft: item[0].toDouble(),
                      fromTop: item[1].toDouble(),
                      translationID: item[2],
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DescriptionAlert extends StatefulWidget {
  const DescriptionAlert({
    this.translation,
    Key key,
  }) : super(key: key);
  final translation;

  @override
  _DescriptionAlertState createState() => _DescriptionAlertState();
}

class _DescriptionAlertState extends State<DescriptionAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.65),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SingleTranslationScreen(widget.translation.id),
                          ),
                        ),
                        child: Icon(
                          Icons.launch_outlined,
                          color: kDefaultColor,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.55,
                    constraints: new BoxConstraints(
                        // maxHeight: MediaQuery.of(context).size.height * 0.55,
                        ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TranslationListItem(
                            language: "LA",
                            translation: widget.translation.la,
                            imagePath: "assets/images/latin_flag_circular.png",
                          ),
                          TranslationListItem(
                            language: "DE",
                            translation: widget.translation.de,
                            imagePath: "assets/images/german_flag_circular.png",
                          ),
                          TranslationListItem(
                            language: "EN",
                            translation: widget.translation.en,
                            imagePath: "assets/images/uk_flag_circular.png",
                          ),
                          TranslationListItem(
                            language: "LV",
                            translation: widget.translation.lv,
                            imagePath:
                                "assets/images/latvian_flag_circular.png",
                          ),
                          TranslationListItem(
                            language: "RU",
                            translation: widget.translation.ru,
                            imagePath:
                                "assets/images/russian_flag_circular.png",
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Text(
                          //   "f - feminium; m - maskulinium; n - neutrum; pl - pluralis; sg - singularis",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(fontSize: 16),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

class TranslationListItem extends StatelessWidget {
  const TranslationListItem({
    Key key,
    this.language,
    this.imagePath,
    this.translation,
  }) : super(key: key);
  final String language, translation, imagePath;
  @override
  Widget build(BuildContext context) {
    return translation != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  gradient: kDefaultLinearGradient,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: imagePath != null
                        ? Image.asset(
                            imagePath,
                            width: 32,
                          )
                        : SizedBox(
                            width: 32,
                            height: 32,
                          ),
                  ),
                  Text(
                    "${language}: ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${translation}",
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}

// class TranslationListItem extends StatelessWidget {
//   const TranslationListItem({
//     Key key,
//     this.language,
//     this.translation,
//   }) : super(key: key);
//   final String language, translation;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             language.length == 2 ? "   " + "${language}: " : "${language}: ",
//             style: TextStyle(
//               fontSize: 24,
//               color: kSecondaryColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Flexible(
//             child: Text(
//               "${translation}",
//               style: TextStyle(
//                 fontSize: 24,
//                 color: kDefaultColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CustomPin extends StatelessWidget {
  const CustomPin(
      {Key key,
      @required this.imageWidth,
      @required this.size,
      @required this.padding,
      @required this.imageHeight,
      this.fromLeft,
      this.fromTop,
      this.translationID})
      : super(key: key);

  final double imageWidth, imageHeight;
  final Size size;
  final padding;
  final int translationID;
  final double fromLeft, fromTop;

  @override
  Widget build(BuildContext context) {
    DatabaseHelper dbHelper = DatabaseHelper();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    print(padding.right);
    return Positioned(
      top: imageWidth > (size.width - 40)
          ? (((size.width - 40) * (imageHeight / imageWidth)) / imageHeight) *
                  fromTop -
              10
          : fromTop - 10,
      left: imageWidth > (size.width - 40)
          ? ((size.width - 40) / imageWidth) * fromLeft - 15 - padding.right
          : fromLeft - 10,
      child: GestureDetector(
        onTap: () {
          dbHelper.getTranslationById(translationID).then((translation) {
            if (translation != null) {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return DescriptionAlert(
                    translation: translation,
                  );
                },
              );
            }
          });

          print(translationID);
          // getApplicationDocumentsDirectory().then((Directory dir) {
          //   _store =
          //       Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
          //   transBox = _store.box<Translation>();
          //   var query =
          //       transBox.query(Translation_.id.equals(translationID)).build();
          //   translation = query.find();
          // });

          // showDialog<void>(
          //   context: context,
          //   barrierDismissible: false, // user must tap button!
          //   builder: (BuildContext context) {
          //     return DescriptionAlert(
          //       translation: translation[0],
          //     );
          //   },
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 20,
          width: 20,
          // height: size.width < 400
          //     ? 30
          //     : size.width < 850
          //         ? 30
          //         : 30,
          // width: size.width < 400
          //     ? 30
          //     : size.width < 850
          //         ? 30
          //         : 30,
        ),
      ),
    );
  }
}

// class CustomPin extends StatelessWidget {
//   const CustomPin({
//     Key key,
//     @required this.imageWidth,
//     @required this.size,
//     @required this.imageHeight,
//     this.fromRight,
//     this.fromTop,
//   }) : super(key: key);

//   final double imageWidth, imageHeight;
//   final Size size;
//   final double fromRight, fromTop;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: imageWidth > (size.width - 40)
//           ? ((size.width - 40) * (imageHeight / imageWidth)) * fromTop
//           : imageHeight * fromTop,
//       right: imageWidth > (size.width - 40)
//           ? (size.width - 40) * fromRight
//           : imageWidth * fromRight,
//       child: GestureDetector(
//         onTap: () {
//           print(11);
//           showDialog<void>(
//             context: context,
//             barrierDismissible: false, // user must tap button!
//             builder: (BuildContext context) {
//               return DescriptionAlert();
//             },
//           );
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               // color: Colors.black,
//               // borderRadius: BorderRadius.circular(10),
//               ),
//           height: 30,
//           width: 30,
//           // height: size.width < 400
//           //     ? 30
//           //     : size.width < 850
//           //         ? 30
//           //         : 30,
//           // width: size.width < 400
//           //     ? 30
//           //     : size.width < 850
//           //         ? 30
//           //         : 30,
//         ),
//       ),
//     );
//   }
// }
