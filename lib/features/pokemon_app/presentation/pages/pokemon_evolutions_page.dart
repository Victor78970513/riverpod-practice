import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_evolution_card.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_bg.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_header.dart';

class PokemonEvolutionsPage extends ConsumerWidget {
  const PokemonEvolutionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final Color baseColor =
        getColorShade(pokemonInfoState.pokemonSpecies!.color);
    final innerGrowColor = baseColor.withValues(alpha: 0.5);
    return pokemonInfoState.isLoading
        ? CircularProgressIndicator()
        : PokemonInfoBg(
            bgPosition: 0.23,
            showGradient: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SafeArea(
                child: Column(
                  children: [
                    PokemonInfoHeader(
                        pokemonInfo: pokemonInfoState.pokemonInfo!),
                    SizedBox(height: 25),
                    Text(
                      "Evolutions",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            pokemonInfoState.pokemonEvolutions![0].length,
                        itemBuilder: (context, index) {
                          final pokemonEvolution =
                              pokemonInfoState.pokemonEvolutions![0][index];
                          return Column(
                            children: [
                              PokemonEvolutionCard(
                                pokemonEvolution: pokemonEvolution,
                                type: "electric",
                                shadowColor: innerGrowColor,
                              ),
                              if (index !=
                                  pokemonInfoState
                                          .pokemonEvolutions![0].length -
                                      1)
                                Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              if (index ==
                                  pokemonInfoState
                                          .pokemonEvolutions![0].length -
                                      1)
                                SizedBox(height: 100)
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
