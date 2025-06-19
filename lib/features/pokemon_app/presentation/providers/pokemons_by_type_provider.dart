import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/repositories/pokedex_repository.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokedex_repository_provider.dart';

class PokemonsByTypeState {
  final bool isLoading;
  final List<PokemonByType> pokemonsByType;
  final String? error;

  PokemonsByTypeState({
    this.isLoading = true,
    this.pokemonsByType = const [],
    this.error,
  });

  PokemonsByTypeState copyWith({
    bool? isLoading,
    List<PokemonByType>? pokemonsByType,
    String? error,
  }) {
    return PokemonsByTypeState(
      isLoading: isLoading ?? this.isLoading,
      pokemonsByType: pokemonsByType ?? this.pokemonsByType,
      error: error ?? this.error,
    );
  }
}

class PokemonsByTypeNotifier extends StateNotifier<PokemonsByTypeState> {
  final PokedexRepository _pokedexRepository;
  PokemonsByTypeNotifier(this._pokedexRepository)
      : super(PokemonsByTypeState());

  Future<void> fetchPokemonsByType({required String type}) async {
    final response = await _pokedexRepository.fetchPokemonsByType(type: type);
    response.fold(
      (left) {
        state = state.copyWith(isLoading: false, error: left.message);
      },
      (pokemonsByType) {
        state =
            state.copyWith(isLoading: false, pokemonsByType: pokemonsByType);
      },
    );
  }
}

final pokemonsByTypeProvider =
    StateNotifierProvider<PokemonsByTypeNotifier, PokemonsByTypeState>((ref) {
  final repository = ref.watch(pokedexRepositoryProvider);
  return PokemonsByTypeNotifier(repository);
});
