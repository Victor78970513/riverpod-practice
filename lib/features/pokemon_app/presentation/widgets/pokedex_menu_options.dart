import 'package:flutter/material.dart';
import 'package:riverpod_practice/core/router/routes.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokedex_menu_button.dart';

class PokedexMenuOptions extends StatelessWidget {
  const PokedexMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleSize = size.width * 2;
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -size.width * 0.5,
            child: Container(
              width: circleSize,
              height: circleSize,
              padding: EdgeInsets.only(
                top: circleSize * 0.1,
              ),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: circleSize * 0.05),
            child: Column(
              children: [
                PokedexMenuButton(
                  color: Color(0xff9fda93),
                  text: "Types",
                  icon: Icons.pets_outlined,
                  path: AppRoutes.pokedexTypes,
                ),
                PokedexMenuButton(
                  color: Color(0xfff3b37e),
                  text: "Locations",
                  icon: Icons.location_on_outlined,
                  path: AppRoutes.pokedexTypes,
                ),
                PokedexMenuButton(
                  color: Color(0xff9bb8f2),
                  text: "Moves and Abilities",
                  icon: Icons.star_rate_rounded,
                  path: AppRoutes.pokedexTypes,
                ),
                PokedexMenuButton(
                  color: Color(0xffec665f),
                  text: "Favorites",
                  icon: Icons.favorite,
                  path: AppRoutes.pokedexTypes,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
