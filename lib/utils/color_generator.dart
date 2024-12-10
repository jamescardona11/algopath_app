import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  final Random _random = Random();
  final List<Color> _baseColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.indigoAccent,
    Colors.tealAccent,
    Colors.greenAccent,
    const Color(0xffFF0000),
    const Color(0xff92AA83),
    const Color(0xff994636),
    const Color(0xffC8AD55),
    const Color(0xff355691),
    const Color(0xff5F5AA2),
    const Color(0xffFFFBBD),
    const Color(0xff78C0E0),
    const Color(0xff022B3A),
    const Color(0xffFFE45E),
  ];

  final List<Color> _unusedColors = [];

  Color getUniqueColor() {
    if (_unusedColors.isEmpty) {
      _unusedColors.addAll(_baseColors);
    }

    final index = _random.nextInt(_unusedColors.length);
    return _unusedColors.removeAt(index);
  }

  static (Color backgroundColor, Color textColor) getPairColor(Color baseColor) {
    final hslColor = HSLColor.fromColor(baseColor);

    final backgroundColor = HSLColor.fromAHSL(
      0.65,
      hslColor.hue,
      0.6,
      0.95,
    ).toColor();

    final textColor = HSLColor.fromAHSL(
      1.0,
      hslColor.hue,
      0.7,
      0.35,
    ).toColor();

    return (backgroundColor, textColor);
  }
}
