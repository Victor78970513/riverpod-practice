import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_info.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_status_widget.dart';

class PokemonStatusView extends StatelessWidget {
  final PokemonInfo pokemonInfo;
  const PokemonStatusView({
    super.key,
    required this.pokemonInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokemonStatusWidget(
          title: "HP",
          statusValue: pokemonInfo.hp.toDouble(),
          statusColor: Color(0xffec6661),
        ),
        PokemonStatusWidget(
          title: "ATK",
          statusValue: pokemonInfo.atk.toDouble(),
          statusColor: Color(0xfff3b37e),
        ),
        PokemonStatusWidget(
          title: "DEF",
          statusValue: pokemonInfo.def.toDouble(),
          statusColor: Color(0xfffae480),
        ),
        PokemonStatusWidget(
          title: "SATK",
          statusValue: pokemonInfo.satk.toDouble(),
          statusColor: Color(0xff9bb8f2),
        ),
        PokemonStatusWidget(
          title: "SDEF",
          statusValue: pokemonInfo.sdef.toDouble(),
          statusColor: Color(0xffa0da92),
        ),
        PokemonStatusWidget(
          title: "SPD",
          statusValue: pokemonInfo.spd.toDouble(),
          statusColor: Color(0xffef98b4),
        ),
      ],
    );
  }
}
