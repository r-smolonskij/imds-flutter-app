import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
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
                  Image.asset("assets/images/tree.png"),
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
    ));
  }
}
