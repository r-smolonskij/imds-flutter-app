import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/views/InteractivePhotos/InteractivePhotoScreen.dart';
import 'package:flutterTestApp/views/InteractivePhotos/ZiedkopasPhotosListScreen.dart';
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

    return DefaultView(
      title: getTranslation(context, "photos"),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                SingleImage(
                  imageTitle: "augs_icon.png",
                  title: getTranslation(context, "plant_structure"),
                  originalImageTitle: "augs.png",
                  pinsList: [
                    [319, 76, 858],
                    [319, 184, 859],
                    [319, 264, 861],
                    [319, 365, 862],
                    [319, 421, 860],
                    [319, 575, 863],
                  ],
                ),
                SingleImage(
                  imageTitle: "zieds_icon.png",
                  title: getTranslation(context, "flower_structure"),
                  originalImageTitle: "zieds.png",
                  pinsList: [
                    //Left Side
                    [47, 297, 847],
                    [45, 123, 848],
                    [17, 215, 849],
                    //TopLeft
                    [84, 78, 851],
                    [162, 72, 852],
                    [121, 32, 850],
                    //Right
                    [415, 54, 854],
                    [410, 101, 855],
                    [419, 220, 856],
                    [412, 270, 857],
                    [455, 157, 853],
                    //Bottom
                    [287, 315, 846],
                    [287, 383, 845],
                  ],
                ),
                SingleImage(
                  imageTitle: "sakne_icon.png",
                  title: getTranslation(context, "root_structure"),
                  originalImageTitle: "sakne.png",
                  pinsList: [
                    [1200, 326, 896],
                    [1200, 398, 895],
                    [1200, 713, 897],
                    [1200, 1206, 898],
                  ],
                ),
                SingleImage(
                  imageTitle: "pupinja_icon.png",
                  title: getTranslation(context, "seed_structure"),
                  originalImageTitle: "pupinja.png",
                  pinsList: [
                    [1124, 234, 884],
                    [1124, 319, 886],
                    [1124, 454, 885],
                    [1124, 769, 1],
                    [1124, 982, 888],
                  ],
                ),
                SingleImage(
                  imageTitle: "cerinju_lapa_icon.png",
                  title: getTranslation(context, "simple_leaf_structure"),
                  originalImageTitle: "cerinju_lapa.png",
                  pinsList: [
                    [1123, 43, 889],
                    [1123, 349, 890],
                    [1123, 591, 891],
                    [1123, 707, 892],
                    [1123, 1227, 893],
                  ],
                ),
                SingleImage(
                  imageTitle: "lapa_salikta_icon.png",
                  title: getTranslation(context, "composite_leaf_structure"),
                  originalImageTitle: "lapa_salikta.png",
                  pinsList: [
                    [520, 269, 894],
                    [520, 514, 893]
                  ],
                ),
                SingleImage(
                  imageTitle: "Ziedkopas_main.png",
                  title: getTranslation(context, "inflorescences"),
                  originalImageTitle: "Ziedkopas_main.png",
                  onPress: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZiedkopasPhotosListScreen(),
                      ),
                    )
                  },
                ),
              ],
            ),
          )
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
      this.onPress,
      this.translationId})
      : super(key: key);
  final String imageTitle, title, originalImageTitle;
  final List pinsList;
  final int translationId;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () async {
          if (onPress == null) {
            Directory directory = await getApplicationDocumentsDirectory();
            var dbPath = join(directory.path, "${originalImageTitle}");
            ByteData data = await rootBundle
                .load("assets/interactive_images/${originalImageTitle}");
            List<int> bytes =
                data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            var foundFile = await File(dbPath).writeAsBytes(bytes);
            var decodedImage =
                await decodeImageFromList(foundFile.readAsBytesSync());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InteractivePhotoScreen(
                    imageTitle: originalImageTitle,
                    title: title,
                    imageHeight: decodedImage.height.toDouble(),
                    imageWidth: decodedImage.width.toDouble(),
                    pinsList: pinsList,
                    translationId: translationId),
              ),
            );
          } else {
            onPress();
          }
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width / 2 - 40,
          child: Column(
            children: [
              Container(
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
                    : Container(
                        height: MediaQuery.of(context).size.width / 2 - 40,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                      ),
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
