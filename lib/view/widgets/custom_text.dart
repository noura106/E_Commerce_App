import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;

  const CustomText(
      {super.key,
      required this.fontSize,
      required this.text,
        this.alignment=Alignment.topLeft,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment,
        child: Text(text, style: TextStyle(color: color, fontSize: fontSize)));
  }
}
