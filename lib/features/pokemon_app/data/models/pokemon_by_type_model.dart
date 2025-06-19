import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';

class PokemonByTypeModel extends PokemonByType {
  PokemonByTypeModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory PokemonByTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonByTypeModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
    );
  }
}
