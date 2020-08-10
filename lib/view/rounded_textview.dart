import 'package:flutter/material.dart';

class RoundedTextView extends StatelessWidget {
  final String mText;
  final bool isDoneStage;

  const RoundedTextView({this.mText, this.isDoneStage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text(mText,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22.0)),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: isDoneStage ? Colors.lightGreen : Colors.white,
          border: Border.all(color: Colors.black)),
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
    );
  }
}
