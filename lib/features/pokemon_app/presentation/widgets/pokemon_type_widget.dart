import 'package:flutter/material.dart';
import 'package:riverpod_practice/core/utils/pokemon_types_colors.dart';
import 'package:riverpod_practice/core/utils/pokemon_types_icons.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_type.dart';

class PokemonTypeWidget extends StatelessWidget {
  final double width;
  final PokemonType pokemonType;
  const PokemonTypeWidget({
    super.key,
    required this.width,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    final color = pokemonTypeColors[pokemonType.name.toLowerCase()]
            ?.withValues(alpha: 0.8) ??
        Colors.grey;
    final icon = pokemonTypeIcons[pokemonType.name.toLowerCase()] ??
        Icons.help_outline_sharp;
    return Container(
      height: 65,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              pokemonType.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
