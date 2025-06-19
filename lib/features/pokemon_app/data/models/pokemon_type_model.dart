import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';

class PokemonTypeModel extends PokemonType {
  PokemonTypeModel({
    required super.name,
    required super.url,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      name: json["name"],
      url: json["url"],
    );
  }
}
