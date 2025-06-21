double convertMetersToInches(double meters) {
  const double inchesPerMeter = 39.3701;
  return meters * inchesPerMeter;
}

String convertInchesToFeetAndInches(double totalInches) {
  final int feet = (totalInches / 12).floor(); // 1 pie = 12 pulgadas
  final double remainingInches = totalInches % 12;

  // Redondea las pulgadas restantes para evitar muchos decimales, e.g., "1'04""
  // Puedes ajustar la precisión de redondeo si es necesario.
  final String formattedInches = remainingInches.toStringAsFixed(0);

  return "$feet'$formattedInches\"";
}

double convertKgToLbs(double kilograms) {
  double lbsPerKg = 2.20462;
  return double.parse((kilograms * lbsPerKg).toStringAsFixed(2));
}
