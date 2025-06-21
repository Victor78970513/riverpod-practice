import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonsByTypeShimmer extends StatelessWidget {
  const PokemonsByTypeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
