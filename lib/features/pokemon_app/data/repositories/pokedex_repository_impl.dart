import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/core/error/failures.dart';
import 'package:riverpod_practice/features/pokemon_app/data/datasources/pokedex_remote_datasource.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';
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

  @override
  Future<Either<Failure, PokemonInfo>> fetchPokemonInformation(
      {required int pokemonId}) async {
    try {
      final pokemonInfo =
          await remoteDatasource.fetchPokemonInformation(pokemonId: pokemonId);
      return right(pokemonInfo);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonSpecies>> fetchPokemonSpecies(
      {required String url}) async {
    try {
      final pokemonSpecies =
          await remoteDatasource.fetchPokemonSpecies(url: url);
      return right(pokemonSpecies);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<List<PokemonEvolution>>>> fetchPokemonEvolution(
      {required String url}) async {
    try {
      final pokemonEvolution =
          await remoteDatasource.fetchPokemonEvolution(url: url);
      return right(pokemonEvolution);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
