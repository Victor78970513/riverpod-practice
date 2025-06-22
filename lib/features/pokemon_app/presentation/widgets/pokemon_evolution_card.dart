import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';

class PokemonEvolutionCard extends StatelessWidget {
  final PokemonEvolution pokemonEvolution;
  const PokemonEvolutionCard({super.key, required this.pokemonEvolution});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.22,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.15,
            width: size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.blue,
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
          Positioned(
            top: size.height * 0.12,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  pokemonEvolution.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
