import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';

class PokemonInfoModel extends PokemonInfo {
  PokemonInfoModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.urlSpecies,
    required super.frontDefault,
    required super.pokemonType,
  });

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    return PokemonInfoModel(
        id: json["id"],
        name: json["name"],
        height: (json["height"] as int).toDouble(),
        weight: (json["weight"] as int).toDouble(),
        urlSpecies: json["species"]["url"],
        frontDefault: json["sprites"]["other"]["home"]["front_default"],
        pokemonType: json["types"][0]["type"]["name"]);
  }
}

class PokemonSpeciesModel extends PokemonSpecies {
  PokemonSpeciesModel({
    required super.description,
    required super.color,
  });

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    final flavorTextEntries = json["flavor_text_entries"];
    String desc = "No hay descripcion disponible";

    for (final entry in flavorTextEntries) {
      if (entry["language"]["name"] == "es") {
        desc = entry["flavor_text"];
        break;
        // desc = entry["flavor_text"].replaceAll(RegExp(r'[\n\f]'), ' ');
      }
    }
    return PokemonSpeciesModel(
      description: desc,
      color: getPokemonColor(json["color"]["name"]),
    );
  }
}
