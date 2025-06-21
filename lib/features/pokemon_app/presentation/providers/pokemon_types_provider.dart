import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/repositories/pokedex_repository.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokedex_repository_provider.dart';

class PokemonTypesState {
  final bool isLoading;
  final List<PokemonType> pokemonTypes;
  final String? error;

  PokemonTypesState({
    this.isLoading = true,
    this.pokemonTypes = const [],
    this.error,
  });

  PokemonTypesState copyWith({
    bool? isLoading,
    List<PokemonType>? pokemonTypes,
    String? error,
  }) {
    return PokemonTypesState(
      isLoading: isLoading ?? this.isLoading,
      pokemonTypes: pokemonTypes ?? this.pokemonTypes,
      error: error ?? this.error,
    );
  }
}

class PokemonTypesNotifier extends StateNotifier<PokemonTypesState> {
  final PokedexRepository _pokedexRepository;
  PokemonTypesNotifier(this._pokedexRepository) : super(PokemonTypesState());

  Future<void> fetchAllPokemonTypes() async {
    final response = await _pokedexRepository.fetchAllPokemonTypes();
    await Future.delayed(Duration(seconds: 1));
    response.fold(
      (left) {
        state = state.copyWith(error: left.message, isLoading: false);
      },
      (pokemonTypes) {
        state = state.copyWith(
          pokemonTypes: pokemonTypes,
          isLoading: false,
          error: null,
        );
      },
    );
  }
}

final pokemonTypesProvider =
    StateNotifierProvider.autoDispose<PokemonTypesNotifier, PokemonTypesState>(
        (ref) {
  final repository = ref.watch(pokedexRepositoryProvider);
  return PokemonTypesNotifier(repository);
});
