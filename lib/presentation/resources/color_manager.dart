import 'package:flutter/material.dart';

class ColorManager {
  static Color green = HexColor.fromHex("#29b363");
  static Color white = HexColor.fromHex("#ffffff");
  static Color black = HexColor.fromHex("#646464");
  static Color blackBold = HexColor.fromHex("#4b4b4b");
  static Color blackNormal = HexColor.fromHex("#7f7f7f");
  static Color grey = HexColor.fromHex("#a6a6a6");
  static Color blue = HexColor.fromHex("#2c7edb");
  static Color red = HexColor.fromHex("#FF0000");

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}