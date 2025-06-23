import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';

class PokemonEvolutionCard extends ConsumerWidget {
  final PokemonEvolution pokemonEvolution;
  final String type;
  const PokemonEvolutionCard({
    super.key,
    required this.pokemonEvolution,
    required this.type,
  });

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final Color baseColor =
        getColorShade(pokemonInfoState.pokemonSpecies!.color);
    final innerGrowColor = baseColor.withValues(alpha: 0.5);
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.height * 0.2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: innerGrowColor.withValues(alpha: 0.2),
                blurRadius: 50,
              )
            ],
            image: DecorationImage(
              image: NetworkImage(
                pokemonEvolution.imageUrl,
              ),
              onError: (exception, stackTrace) =>
                  AssetImage("assets/no_pokemon.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          pokemonEvolution.name,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
