import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var hexColorUpCase = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColorUpCase.length == 6) {
      hexColorUpCase = "FF$hexColorUpCase";
      return int.parse(hexColorUpCase, radix: 16);
    }

    return null;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
