import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';

class PokemonInfoHeader extends StatelessWidget {
  final PokemonInfo pokemonInfo;
  const PokemonInfoHeader({
    super.key,
    required this.pokemonInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            "assets/white_pokeball.png",
          ),
        ),
        SizedBox(width: 12),
        Text(
          "${pokemonInfo.name} #${pokemonInfo.id}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
