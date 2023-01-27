import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  int? maxLines;
  double? fontSize;
  Color? color;
  VoidCallback? onTap;

  CustomTextWidget({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontSize,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(fontSize: fontSize ?? 15, color: color ?? Colors.black),
        ),
      ),
    );
  }
}
