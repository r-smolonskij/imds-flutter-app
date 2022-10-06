import 'package:flutter/material.dart';

class PiktoIcon extends StatelessWidget {
  const PiktoIcon({Key key, this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Image.asset(
          "assets/images/piktogrammas/${imagePath}",
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
