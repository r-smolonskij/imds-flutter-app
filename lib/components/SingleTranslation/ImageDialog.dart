import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterTestApp/constants.dart';
import 'dart:io';

class ImageDialog extends StatefulWidget {
  const ImageDialog({Key key, this.imageName}) : super(key: key);
  final String imageName;

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  //
  var imageData;
  @override
  void initState() {
    checkImage();
    super.initState();
  }

  checkImage() async {
    var imageFormats = [".jpeg", ".jpg", ".png"];
    await Future.forEach(imageFormats, (format) async {
      var imageName = "${widget.imageName}${format}";
      await isPathExists(imageName);
    });
  }

  isPathExists(imageFullName) async {
    try {
      var assetbundle = DefaultAssetBundle.of(context);
      ByteData res =
          await assetbundle.load('assets/images/plant_images/${imageFullName}');
      var list = Uint8List.sublistView(res);
      setState(() {
        imageData = Image.memory(list);
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: imageData != null
            ? GestureDetector(
                onTap: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            imageData
                            // Image.asset("assets/images/tree.png"),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.image,
                  color: kDefaultColor,
                  size: 72,
                ),
              )
            : SizedBox());
  }
}
