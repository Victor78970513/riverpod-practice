import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/custom_header.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokedex_menu_options.dart';

class PokedexMenuPage extends StatelessWidget {
  const PokedexMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 98, 93, 1),
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(),
            Transform.rotate(
              angle: -0.8,
              child: Image.asset(
                height: size.height * 0.4,
                "assets/white_2.png",
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            PokedexMenuOptions(),
          ],
        ),
      ),
    );
  }
}
