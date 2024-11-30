import 'dart:math';

import 'package:flutter/material.dart';

abstract class ColorGenerator {
  static final Random _random = Random();

  /// Returns a random material color
  static Color getRandomColor() {
    // List of material colors excluding blacks, whites, and browns
    final List<MaterialColor> colors = [
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
    ];

    // Get a random color from the list
    final baseColor = colors[_random.nextInt(colors.length)];

    // Get a random shade (100-900, excluding 50)
    final shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
    final shade = shades[_random.nextInt(shades.length)];

    return baseColor[shade]!;
  }

  /// Returns a random pastel color
  static Color getRandomPastelColor() {
    const double saturation = 0.6; // Lower saturation for pastel effect
    const double brightness = 0.95; // Higher brightness for pastel effect

    return HSLColor.fromAHSL(
      1.0,
      _random.nextDouble() * 360, // Random hue
      saturation,
      brightness,
    ).toColor();
  }
}
