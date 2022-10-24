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
      title: getTranslation(context, "interactive_photos"),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
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
                  ],
                ),
                SingleImage(
                  imageTitle: "sakne_icon.png",
                  title: "Saknes uzbūve",
                  originalImageTitle: "sakne.png",
                  pinsList: [
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
                    [520, 269, 1],
                    [520, 514, 1]
                  ],
                ),
                SingleImage(
                  imageTitle: "ziedkopa_1.png",
                  title: "Ziedkopas",
                  originalImageTitle: "ziedkopa_1.png",
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
