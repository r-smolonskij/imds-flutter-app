import 'package:flutter/material.dart';
import 'package:flutterTestApp/constants.dart';

class RegularCustomButton extends StatelessWidget {
  const RegularCustomButton(
      {Key key,
      this.onPress,
      this.text,
      this.textStyle,
      this.backgroundColor,
      this.borderWidth,
      this.borderColor,
      this.paddingVertical,
      this.paddingHorizontal})
      : super(key: key);
  final Function onPress;
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor, borderColor;
  final double borderWidth, paddingVertical, paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    var localBackgroundColor =
        backgroundColor != null ? backgroundColor : Colors.transparent;
    var localBorderColor = borderColor != null
        ? borderColor
        : borderWidth == 0
            ? Colors.transparent
            : kDefaultColor;
    var localBorderWidth = borderWidth != null ? borderWidth : 2.0;
    var localPaddingVertical = paddingVertical != null ? paddingVertical : 5.0;
    var localPaddingHorizontal =
        paddingHorizontal != null ? paddingHorizontal : 5.0;
    var localTextStyle = textStyle != null
        ? textStyle
        : TextStyle(
            fontSize: 20,
            color: kDefaultColor,
            fontWeight: FontWeight.w600,
          );
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: localBackgroundColor,
          border: Border.all(
            width: localBorderWidth,
            color: localBorderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: localPaddingHorizontal, vertical: localPaddingVertical),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: localTextStyle,
        ),
      ),
    );
  }
}
