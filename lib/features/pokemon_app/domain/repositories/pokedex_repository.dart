import 'package:riverpod_practice/core/error/failures.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';
import 'package:dartz/dartz.dart';

abstract interface class PokedexRepository {
  Future<Either<Failure, List<PokemonType>>> fetchAllPokemonTypes();

  Future<Either<Failure, List<PokemonByType>>> fetchPokemonsByType({
    required String type,
  });

  Future<Either<Failure, PokemonInfo>> fetchPokemonInformation({
    required int pokemonId,
  });

  Future<Either<Failure, PokemonSpecies>> fetchPokemonSpecies(
      {required String url});

  Future<Either<Failure, List<List<PokemonEvolution>>>> fetchPokemonEvolution(
      {required String url});
}
