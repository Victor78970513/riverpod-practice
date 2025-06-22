import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_evolution_card.dart';

class PokemonEvolutionsPage extends ConsumerWidget {
  const PokemonEvolutionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final size = MediaQuery.of(context).size;
    final Color baseColor = getColorShade(
        pokemonInfoState.pokemonSpecies?.color ?? Colors.transparent);
    final innerGrowColor = baseColor.withValues(alpha: 0.8);
    final circleSize = size.width * 2;
    return pokemonInfoState.isLoading
        ? CircularProgressIndicator()
        : Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: innerGrowColor,
              ),
              Positioned(
                top: size.height * 0.15,
                left: -size.width * 0.5,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                right: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    pokemonInfoState.pokemonEvolutions![0].length,
                    (index) {
                      final pokemonEvolution =
                          pokemonInfoState.pokemonEvolutions![0][index];
                      return PokemonEvolutionCard(
                        pokemonEvolution: pokemonEvolution,
                      );
                      // Text(
                      //   "${pokemonInfoState.pokemonEvolutions![0].length}",
                      //   style: TextStyle(fontSize: 30),
                      // );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
