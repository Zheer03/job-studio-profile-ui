import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;

  const TextWidget(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.height,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: "SF-Pro",
          height: height,
          letterSpacing: letterSpacing),
    );
  }
}
