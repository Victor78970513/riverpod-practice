import 'package:riverpod_practice/core/error/exceptions.dart';
import 'package:riverpod_practice/features/pokemon_app/data/models/pokemon_by_type_model.dart';
import 'package:riverpod_practice/features/pokemon_app/data/models/pokemon_type_model.dart';
import 'package:dio/dio.dart';

abstract interface class PokedexRemoteDatasource {
  Future<List<PokemonTypeModel>> fetchAllPokemonTypes();
  Future<List<PokemonByTypeModel>> fetchPokemonsByType({required String type});
}

class PokedexRemoteDatasourceImpl implements PokedexRemoteDatasource {
  final dio = Dio();
  @override
  Future<List<PokemonTypeModel>> fetchAllPokemonTypes() async {
    try {
      final response = await dio.get("https://pokeapi.co/api/v2/type");
      final types = response.data["results"] as List<dynamic>;
      final pokemonTypes =
          types.map((type) => PokemonTypeModel.fromJson(type)).toList();
      return pokemonTypes;
    } catch (e) {
      print(e.toString());
      throw ServerException("Error al traer los tipos de pokemon");
    }
  }

  @override
  Future<List<PokemonByTypeModel>> fetchPokemonsByType(
      {required String type}) async {
    try {
      final response = await dio.get("https://pokeapi.co/api/v2/type/$type");
      await Future.delayed(const Duration(seconds: 5));
      final pokemons = response.data["pokemon"] as List<dynamic>;
      final pokemonsByType = pokemons
          .map((pokemon) => PokemonByTypeModel.fromJson(pokemon))
          .toList();
      return pokemonsByType;
    } catch (e) {
      print(e.toString());
      throw ServerException("Error al traer pokemones por tipo");
    }
  }
}
