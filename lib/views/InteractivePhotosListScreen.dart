import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/views/InteractivePhotoScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class InteractivePhotosListScreen extends StatefulWidget {
  @override
  _InteractivePhotosListScreenState createState() =>
      _InteractivePhotosListScreenState();
}

class _InteractivePhotosListScreenState
    extends State<InteractivePhotosListScreen> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    var size = MediaQuery.of(context).size;
    return DefaultView(
      title: "Interaktīvās bildes",
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleImage(
                  imageTitle: "augs_icon.png",
                  title: "Auga uzbūve",
                  originalImageTitle: "augs.png",
                  pinsList: [
                    [319, 76, 1],
                    [319, 184, 2],
                    [319, 264, 3],
                    [319, 365, 4],
                    [319, 421, 5],
                    [319, 575, 6],
                    // [0.235, 0.212],
                    // [0.235, 0.085],
                    // [0.235, 0.307],
                    // [0.235, 0.427],
                    // [0.235, 0.494],
                    // [0.235, 0.677],
                  ],
                ),
                SingleImage(
                  imageTitle: "zieds_icon.png",
                  title: "Zieda uzbūve",
                  originalImageTitle: "zieds.png",
                  pinsList: [
                    //Left Side
                    [47, 297, 1],
                    [45, 123, 1],
                    [17, 215, 1],
                    //TopLeft
                    [84, 78, 1],
                    [162, 72, 1],
                    [121, 32, 1],
                    //Right
                    [415, 54, 1],
                    [410, 101, 1],
                    [419, 220, 1],
                    [412, 270, 1],
                    [455, 157, 1],
                    //Bottom
                    [287, 315, 1],
                    [287, 383, 1],

                    // [0.81, 0.15],
                    // [0.65, 0.14],
                    // [0.735, 0.055],
                    // [0.9, 0.24],
                    // [0.89, 0.6],
                    // [0.95, 0.435],
                    // [0.125, 0.1],
                    // [0.14, 0.195],
                    // [0.125, 0.445],
                    // [0.135, 0.545],
                    // [0.045, 0.315],
                    // [0.39, 0.645],
                    // [0.39, 0.785],
                  ],
                ),
                SingleImage(
                  imageTitle: "sakne_icon.png",
                  title: "Saknes uzbūve",
                  originalImageTitle: "sakne.png",
                  pinsList: [
                    // [0.015, 0.255],
                    // [0.015, 0.315],
                    // [0.015, 0.57],
                    // [0.015, 0.97],
                    [1200, 326, 1],
                    [1200, 398, 1],
                    [1200, 713, 1],
                    [1200, 1206, 1],
                  ],
                ),
                SingleImage(
                  imageTitle: "pupinja_icon.png",
                  title: "Sēklas uzbūve",
                  originalImageTitle: "pupinja.png",
                  pinsList: [
                    // [0.037, 0.26],
                    // [0.037, 0.18],
                    // [0.037, 0.375],
                    // [0.037, 0.642],
                    // [0.037, 0.82],
                    [1124, 234, 1],
                    [1124, 319, 1],
                    [1124, 454, 1],
                    [1124, 769, 1],
                    [1124, 982, 1],
                  ],
                ),
                SingleImage(
                  imageTitle: "cerinju_lapa_icon.png",
                  title: "Vienkāršas lapas uzbūve",
                  originalImageTitle: "cerinju_lapa.png",
                  pinsList: [
                    // [0.02, 0.015],
                    // [0.02, 0.2],
                    // [0.02, 0.35],
                    // [0.02, 0.42],
                    // [0.02, 0.75],
                    [1123, 43, 1],
                    [1123, 349, 1],
                    [1123, 591, 1],
                    [1123, 707, 1],
                    [1123, 1227, 1],
                  ],
                ),
                SingleImage(
                  imageTitle: "lapa_salikta_icon.png",
                  title: "Saliktas lapas uzbūve",
                  originalImageTitle: "lapa_salikta.png",
                  pinsList: [
                    // [0.018, 0.365],
                    // [0.018, 0.625],
                    [520, 269, 1],
                    [520, 514, 1]
                  ],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_1.png",
                  title: "Ziedkopas 1",
                  originalImageTitle: "ziedkopa_1.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_2.png",
                  title: "Ziedkopas 2",
                  originalImageTitle: "ziedkopa_2.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_3.png",
                  title: "Ziedkopas 3",
                  originalImageTitle: "ziedkopa_3.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_4.png",
                  title: "Ziedkopas 4",
                  originalImageTitle: "ziedkopa_4.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_5.png",
                  title: "Ziedkopas 5",
                  originalImageTitle: "ziedkopa_5.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_6.png",
                  title: "Ziedkopas 6",
                  originalImageTitle: "ziedkopa_6.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_7.png",
                  title: "Ziedkopas 7",
                  originalImageTitle: "ziedkopa_7.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_8.png",
                  title: "Ziedkopas 8",
                  originalImageTitle: "ziedkopa_8.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_9.png",
                  title: "Ziedkopas 9",
                  originalImageTitle: "ziedkopa_9.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_10.png",
                  title: "Ziedkopas 10",
                  originalImageTitle: "ziedkopa_10.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_11.png",
                  title: "Ziedkopas 11",
                  originalImageTitle: "ziedkopa_11.png",
                  infoButton: [0, 0, 44],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_12.png",
                  title: "Ziedkopas 12",
                  originalImageTitle: "ziedkopa_12.png",
                  infoButton: [0, 0, 44],
                ),
              ],
            ),
          )
          // FlatButton(onPressed: AppLocalizations., child: Text("Click me"))
        ],
      ),
    );
  }
}

class SingleImage extends StatelessWidget {
  const SingleImage(
      {Key key,
      this.imageTitle,
      this.title,
      this.originalImageTitle,
      this.pinsList,
      this.infoButton})
      : super(key: key);
  final String imageTitle, title, originalImageTitle;
  final List pinsList;
  final List infoButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () async {
          Directory directory = await getApplicationDocumentsDirectory();
          print(directory.path);
          var dbPath = join(directory.path, "${originalImageTitle}");
          ByteData data = await rootBundle
              .load("assets/interactive_images/${originalImageTitle}");
          List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          var foundFile = await File(dbPath).writeAsBytes(bytes);
          var decodedImage =
              await decodeImageFromList(foundFile.readAsBytesSync());
          print(decodedImage.height);
          print(decodedImage.width);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InteractivePhotoScreen(
                  imageTitle: originalImageTitle,
                  title: title,
                  imageHeight: decodedImage.height.toDouble(),
                  imageWidth: decodedImage.width.toDouble(),
                  pinsList: pinsList,
                  infoButton: infoButton),
            ),
          );
        },
        // () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => InteractivePhotoScreen(
        //       imageTitle: originalImageTitle,
        //       title: title,
        //     ),
        //   ),
        // ),
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width / 2 - 40,
          child: Column(
            children: [
              Container(
                // color: kDefaultColor,
                // height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  gradient: kDefaultLinearGradient,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: imageTitle != null
                    ? Image.asset(
                        "assets/interactive_images/" + imageTitle.toString(),
                        height: MediaQuery.of(context).size.width / 2 - 40,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        fit: BoxFit.contain,
                      )
                    : null,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title != null ? title : "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
