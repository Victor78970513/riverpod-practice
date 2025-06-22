import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';

class PokemonInfoBg extends ConsumerWidget {
  final Widget child;
  final double bgPosition;
  final bool showGradient;
  const PokemonInfoBg({
    super.key,
    required this.child,
    required this.bgPosition,
    this.showGradient = true,
  });

  @override
  Widget build(BuildContext context, ref) {
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final Color baseColor =
        getColorShade(pokemonInfoState.pokemonSpecies!.color);
    final innerGrowColor = baseColor.withValues(alpha: 0.5);
    final size = MediaQuery.of(context).size;
    final circleSize = size.width * 2;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: showGradient ? null : innerGrowColor.withValues(alpha: 0.7),
        gradient: showGradient
            ? LinearGradient(
                colors: [
                  innerGrowColor,
                  baseColor,
                  baseColor.darken(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.6,
                  1,
                ],
              )
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            // bottom: -size.width * 0.7,
            bottom: -size.width * bgPosition,
            left: -size.width * 0.5,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: showGradient ? null : Colors.white,
                gradient: showGradient
                    ? LinearGradient(
                        colors: [
                          Color(0xfff9f9f9).withValues(alpha: 0.6),
                          Color(0xfff9f9f9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.3,
                        ],
                      )
                    : null,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
