import 'package:flutter/material.dart';

class TextViewWithSizeBold extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color color;
  final double marginHorizontal;
  final double marginVertical;

  const TextViewWithSizeBold(this.text,
      {this.fontSize, this.color, this.marginVertical, this.marginHorizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, color: color != null ? color : Colors.black),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal != null ? marginHorizontal : 5.0,
          vertical: marginVertical != null ? marginVertical : 5.0),
    );
  }
}
