import 'package:flutter/material.dart';
import 'package:riverpod_practice/core/utils/calculations.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';

class PokemonAboutView extends StatelessWidget {
  final PokemonInfo pokemonInfo;
  final PokemonSpecies pokemonSpecies;
  const PokemonAboutView({
    super.key,
    required this.pokemonInfo,
    required this.pokemonSpecies,
  });

  @override
  Widget build(BuildContext context) {
    final meters = pokemonInfo.height / 10;
    final weight = pokemonInfo.weight / 10;
    final inches = convertInchesToFeetAndInches(convertMetersToInches(meters));
    final lbs = convertKgToLbs(weight);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          pokemonSpecies.description,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Height",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "$meters m",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  inches,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Weight",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "$lbs",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "$weight Kg",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Strong against",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
