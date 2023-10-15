import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final Alignment alignment;
  final int? maxLine;
  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLine,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
      ),
    );
  }
}
