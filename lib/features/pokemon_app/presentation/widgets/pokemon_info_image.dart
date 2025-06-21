import 'package:flutter/material.dart';

class PokemonInfoImage extends StatelessWidget {
  final String imageUrl;
  const PokemonInfoImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: size.width,
      child: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: -0.8,
              child: Image.asset(
                height: size.height * 0.4,
                "assets/white_2.png",
                color: Colors.white,
              ),
            ),
            Positioned.fill(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
