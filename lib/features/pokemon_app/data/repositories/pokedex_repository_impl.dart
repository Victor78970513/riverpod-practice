import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/core/error/failures.dart';
import 'package:riverpod_practice/features/pokemon_app/data/datasources/pokedex_remote_datasource.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexRemoteDatasource remoteDatasource;

  PokedexRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<PokemonType>>> fetchAllPokemonTypes() async {
    try {
      final pokemonTypes = await remoteDatasource.fetchAllPokemonTypes();
      return right(pokemonTypes);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PokemonByType>>> fetchPokemonsByType(
      {required String type}) async {
    try {
      final pokemonsByType =
          await remoteDatasource.fetchPokemonsByType(type: type);
      return right(pokemonsByType);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
