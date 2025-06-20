import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';

class PokemonInfo {
  //ABOUT
  final int id;
  final String name;
  final double height;
  final double weight;
  final String description;
  final List<PokemonType> againstTo;

  // Status
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
    required this.description,
    required this.againstTo,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
  });
}
