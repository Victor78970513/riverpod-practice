import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';

class PokemonMovesView extends StatelessWidget {
  final List<PokemonMove> pokemonMoves;

  const PokemonMovesView({super.key, required this.pokemonMoves});
  String _formatMoveName(String name) {
    return name.replaceAll('-', ' ').split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    if (pokemonMoves.isEmpty) {
      return const Center(child: Text('No moves available.'));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView.separated(
        itemCount: pokemonMoves.length,
        itemBuilder: (context, index) {
          final move = pokemonMoves[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              _formatMoveName(move.name),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 1,
          );
        },
      ),
    );
  }
}
