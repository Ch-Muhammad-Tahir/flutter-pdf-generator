import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color? textColor;
  final double? fontSize;
  final int? maxLine;
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  const CustomText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.maxLine,
      this.textAlign,
      this.fontWeight,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
