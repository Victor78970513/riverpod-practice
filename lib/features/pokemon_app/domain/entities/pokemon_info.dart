import 'dart:ui';

class PokemonInfo {
  //ABOUT
  final int id;
  final String name;
  final double height;
  final double weight;
  final String urlSpecies;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.urlSpecies,
  });
}

class PokemonSpecies {
  final String description;
  final Color color;

  PokemonSpecies({
    required this.description,
    required this.color,
  });
}
