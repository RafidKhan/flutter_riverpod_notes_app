import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  int? maxLines;
  double? fontSize;
  Color? color;

  CustomTextWidget({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style:
            TextStyle(fontSize: fontSize ?? 15, color: color ?? Colors.black),
      ),
    );
  }
}
