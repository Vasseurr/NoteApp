import 'package:flutter/material.dart';

class ExpermioText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double height;

  ExpermioText({this.text, this.textColor: Colors.white, this.height: 30});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(color: textColor, fontSize: height),
    );
  }
}
