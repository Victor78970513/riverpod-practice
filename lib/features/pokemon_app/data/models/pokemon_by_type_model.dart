import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';

class PokemonByTypeModel extends PokemonByType {
  PokemonByTypeModel({
    required super.id,
    required super.frontDefault,
    required super.name,
  });

  factory PokemonByTypeModel.fromJson(Map<String, dynamic> json) {
    final url = json["pokemon"]["url"] as String;
    final id = int.parse(url.split('/')[url.split('/').length - 2]);
    return PokemonByTypeModel(
      id: id,
      frontDefault:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
      name: json["pokemon"]["name"],
    );
  }
}
