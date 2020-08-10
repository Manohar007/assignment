import 'package:flutter/material.dart';

class RoundedImageVIewChecked extends StatelessWidget {
  final bool isDoneStage;

  const RoundedImageVIewChecked({this.isDoneStage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: isDoneStage ? Colors.lightGreen : Colors.white,
      ),
      padding: EdgeInsets.all(6.0),
    );
  }
}
