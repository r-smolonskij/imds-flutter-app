import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: kDefaultColor,
        ),
      ),
    );
  }
}
