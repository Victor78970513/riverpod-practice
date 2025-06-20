import 'package:flutter/material.dart';

Color getPokemonColor(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'black':
      return Colors.black;
    case 'blue':
      return Colors.blue;
    case 'brown':
      return Colors.brown;
    case 'gray':
      return Colors.grey;
    case 'green':
      return Colors.green;
    case 'pink':
      return Colors.pink;
    case 'purple':
      return Colors.purple;
    case 'red':
      return Colors.red;
    case 'white':
      return Colors.white;
    case 'yellow':
      return Colors.yellow;
    default:
      return Colors.blueGrey;
  }
}

getColorShade(Color color) {
  switch (color) {
    case Colors.yellow:
      return Colors.yellow.shade700;
    default:
      return color;
  }
}

extension ColorManipulation on Color {
  /// Oscurece un color en un porcentaje dado.
  /// [percentage] es un valor entre 0.0 y 1.0.
  Color darken([double percentage = 0.1]) {
    assert(percentage >= 0 && percentage <= 1.0);
    final HSLColor hsl = HSLColor.fromColor(this);
    final double newLightness = (hsl.lightness - percentage).clamp(0.0, 1.0);
    return hsl.withLightness(newLightness).toColor();
  }

  /// Aclara un color en un porcentaje dado.
  /// [percentage] es un valor entre 0.0 y 1.0.
  Color lighten([double percentage = 0.1]) {
    assert(percentage >= 0 && percentage <= 1.0);
    final HSLColor hsl = HSLColor.fromColor(this);
    final double newLightness = (hsl.lightness + percentage).clamp(0.0, 1.0);
    return hsl.withLightness(newLightness).toColor();
  }
}
