import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/views/InteractivePhotos/InteractivePhotosListScreen.dart';

class ZiedkopasPhotosListScreen extends StatefulWidget {
  const ZiedkopasPhotosListScreen({Key key}) : super(key: key);

  @override
  State<ZiedkopasPhotosListScreen> createState() =>
      _ZiedkopasPhotosListScreenState();
}

class _ZiedkopasPhotosListScreenState extends State<ZiedkopasPhotosListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultView(
      title: getTranslation(context, "inflorescences"),
      goBack: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(children: [
              SingleImage(
                imageTitle: "ziedkopa_1.png",
                title: "${getTranslation(context, 'inflorescences')} 1",
                originalImageTitle: "ziedkopa_1.png",
                translationId: 1,
              ),
              SingleImage(
                imageTitle: "ziedkopa_2.png",
                title: "${getTranslation(context, 'inflorescences')} 2",
                originalImageTitle: "ziedkopa_2.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_3.png",
                title: "${getTranslation(context, 'inflorescences')} 3",
                originalImageTitle: "ziedkopa_3.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_4.png",
                title: "${getTranslation(context, 'inflorescences')} 4",
                originalImageTitle: "ziedkopa_4.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_5.png",
                title: "${getTranslation(context, 'inflorescences')} 5",
                originalImageTitle: "ziedkopa_5.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_6.png",
                title: "${getTranslation(context, 'inflorescences')} 6",
                originalImageTitle: "ziedkopa_6.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_7.png",
                title: "${getTranslation(context, 'inflorescences')} 7",
                originalImageTitle: "ziedkopa_7.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_8.png",
                title: "${getTranslation(context, 'inflorescences')} 8",
                originalImageTitle: "ziedkopa_8.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_9.png",
                title: "${getTranslation(context, 'inflorescences')} 9",
                originalImageTitle: "ziedkopa_9.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_10.png",
                title: "${getTranslation(context, 'inflorescences')} 10",
                originalImageTitle: "ziedkopa_10.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_11.png",
                title: "${getTranslation(context, 'inflorescences')} 11",
                originalImageTitle: "ziedkopa_11.png",
              ),
              SingleImage(
                imageTitle: "ziedkopa_12.png",
                title: "${getTranslation(context, 'inflorescences')} 12",
                originalImageTitle: "ziedkopa_12.png",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
