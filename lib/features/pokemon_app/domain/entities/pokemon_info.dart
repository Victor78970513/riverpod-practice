import 'dart:ui';

class PokemonInfo {
  //ABOUT
  final int id;
  final String name;
  final double height;
  final double weight;
  final String urlSpecies;
  final String frontDefault;
  final String pokemonType;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.urlSpecies,
    required this.frontDefault,
    required this.pokemonType,
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
