import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/repositories/pokedex_repository.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokedex_repository_provider.dart';

class PokemonInfoState {
  final bool isLoading;
  final PokemonInfo? pokemonInfo;
  final PokemonSpecies? pokemonSpecies;
  final List<List<PokemonEvolution>>? pokemonEvolutions;
  final String? error;

  PokemonInfoState({
    this.isLoading = true,
    this.pokemonInfo,
    this.pokemonSpecies,
    this.pokemonEvolutions,
    this.error,
  });

  PokemonInfoState copyWith({
    bool? isLoading,
    PokemonInfo? pokemonInfo,
    PokemonSpecies? pokemonSpecies,
    List<List<PokemonEvolution>>? pokemonEvolutions,
    String? error,
  }) {
    return PokemonInfoState(
      isLoading: isLoading ?? this.isLoading,
      pokemonInfo: pokemonInfo ?? this.pokemonInfo,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      pokemonEvolutions: pokemonEvolutions ?? this.pokemonEvolutions,
      error: error ?? this.error,
    );
  }
}

class PokemonInfoNotifier extends StateNotifier<PokemonInfoState> {
  final PokedexRepository _pokedexRepository;
  PokemonInfoNotifier(this._pokedexRepository) : super(PokemonInfoState());

  Future<void> fetchPokemonInfo({required int pokemonId}) async {
    final response =
        await _pokedexRepository.fetchPokemonInformation(pokemonId: pokemonId);
    response.fold(
      (left) {
        state = state.copyWith(
          isLoading: false,
          error: left.message,
        );
      },
      (pokemonInfo) async {
        final responseSpecies = await _pokedexRepository.fetchPokemonSpecies(
          url: pokemonInfo.urlSpecies,
        );
        responseSpecies.fold(
          (left) {
            state = state.copyWith(isLoading: false, error: left.message);
          },
          (pokemonSpecies) async {
            final pokemonEvolutions = await _pokedexRepository
                .fetchPokemonEvolution(url: pokemonSpecies.evolutionUrl);
            pokemonEvolutions.fold((left) {
              state = state.copyWith(isLoading: false, error: left.message);
            }, (pokemonEvolutions) {
              state = state.copyWith(
                isLoading: false,
                pokemonInfo: pokemonInfo,
                pokemonSpecies: pokemonSpecies,
                pokemonEvolutions: pokemonEvolutions,
              );
            });
          },
        );
      },
    );
  }
}

final pokemonInfoProvider =
    StateNotifierProvider.autoDispose<PokemonInfoNotifier, PokemonInfoState>(
        (ref) {
  final repository = ref.watch(pokedexRepositoryProvider);
  return PokemonInfoNotifier(repository);
});
