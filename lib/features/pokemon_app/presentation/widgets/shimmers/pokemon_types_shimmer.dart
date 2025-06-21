import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonTypesShimmer extends StatelessWidget {
  const PokemonTypesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 65,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ));
          },
        ),
      ),
    );
  }
}
