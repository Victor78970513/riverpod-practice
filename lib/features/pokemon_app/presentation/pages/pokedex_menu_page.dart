import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokedex_options.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/white_pokeball.png",
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Pokedex",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Transform.rotate(
              angle: -0.8,
              child: Image.asset(
                height: size.height * 0.4,
                "assets/white_2.png",
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: PokedexOptions(),
            ),
            // Expanded(
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 20.0, horizontal: 16.0),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       shape: BoxShape.rectangle,
            //       borderRadius: BorderRadius.vertical(
            //         top: Radius.circular(100),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
