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
  final List<PokemonMove> pokemonMoves;

  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.urlSpecies,
    required this.frontDefault,
    required this.pokemonType,
    required this.pokemonMoves,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
  });
}

class PokemonSpecies {
  final String description;
  final Color color;
  final String evolutionUrl;

  PokemonSpecies({
    required this.description,
    required this.color,
    required this.evolutionUrl,
  });
}

class PokemonMove {
  final String name;

  PokemonMove({required this.name});
}

class PokemonEvolution {
  final String name;
  final int id;
  final String imageUrl;

  PokemonEvolution({
    required this.name,
    required this.id,
    required this.imageUrl,
  });
}
