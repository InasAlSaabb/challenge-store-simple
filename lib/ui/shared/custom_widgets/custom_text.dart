import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';

enum TextStyleType {
  TITLE,
  SUBTITLE,
  BODY,
  SMALL,
  CUSTOM,
}

class CustomText extends StatelessWidget {
  final TextStyleType textType;
  final String text;
  final Color color;

  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const CustomText({
    Key? key,
    required this.textType,
    required this.text,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: getTextStyle(context),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (textType) {
      case TextStyleType.TITLE:
        return TextStyle(
            height: 1.2,
            decoration: textDecoration,
            color: color,
            fontSize: screenWidth(18),
            fontWeight: FontWeight.w700);

      case TextStyleType.SUBTITLE:
        return TextStyle(
            height: 1.2,
            decoration: textDecoration,
            color: color,
            fontSize: screenWidth(
              25,
            ),
            fontWeight: FontWeight.w600);

      case TextStyleType.BODY:
        return TextStyle(
            height: 1.2,
            decoration: textDecoration,
            color: color,
            fontSize: screenWidth(25),
            fontWeight: FontWeight.w400);

      case TextStyleType.SMALL:
        return TextStyle(
            height: 1.2,
            decoration: textDecoration,
            color: color,
            fontSize: screenWidth(55),
            fontWeight: FontWeight.normal);

      case TextStyleType.CUSTOM:
        return TextStyle(
            height: 1.2,
            decoration: textDecoration,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight);
    }
  }
}
