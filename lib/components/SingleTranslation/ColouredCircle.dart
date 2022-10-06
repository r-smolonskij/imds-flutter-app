import 'package:flutter/material.dart';

class ColouredCircle extends StatelessWidget {
  const ColouredCircle({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1, color: Colors.black),
          color: this.color,
        ),
      ),
    );
  }
}
