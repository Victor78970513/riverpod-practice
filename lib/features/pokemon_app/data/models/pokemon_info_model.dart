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
    required super.pokemonMoves,
    required super.hp,
    required super.atk,
    required super.def,
    required super.satk,
    required super.sdef,
    required super.spd,
  });

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    return PokemonInfoModel(
      id: json["id"],
      name: json["name"],
      height: (json["height"] as int).toDouble(),
      weight: (json["weight"] as int).toDouble(),
      urlSpecies: json["species"]["url"],
      frontDefault: json["sprites"]["other"]["home"]["front_default"],
      pokemonType: json["types"][0]["type"]["name"],
      pokemonMoves: List<PokemonMoveModel>.from(
        json["moves"].map(
          (move) => PokemonMoveModel.fromJson(move),
        ),
      ),
      hp: json["stats"][0]["base_stat"],
      atk: json["stats"][1]["base_stat"],
      def: json["stats"][2]["base_stat"],
      satk: json["stats"][3]["base_stat"],
      sdef: json["stats"][4]["base_stat"],
      spd: json["stats"][5]["base_stat"],
    );
  }
}

class PokemonMoveModel extends PokemonMove {
  PokemonMoveModel({
    required super.name,
  });

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    return PokemonMoveModel(name: json["move"]["name"]);
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
