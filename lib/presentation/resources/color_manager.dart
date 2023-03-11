import 'package:flutter/material.dart';

class ColorManager {
  static Color green = HexColor.fromHex("#29b363");
  static Color white = HexColor.fromHex("#f5faf7");
  static Color black = HexColor.fromHex("#646464");
  static Color grey = HexColor.fromHex("#646464");
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