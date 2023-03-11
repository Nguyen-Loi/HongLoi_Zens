import 'package:flutter/cupertino.dart';

class HomeViewBaseText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const HomeViewBaseText(this.text,{super.key, this.fontSize=13, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}
