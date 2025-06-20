import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_header.dart';

class PokemonInfoPage extends ConsumerStatefulWidget {
  final int pokemonId;
  const PokemonInfoPage(this.pokemonId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonInfoPageState();
}

class _PokemonInfoPageState extends ConsumerState<PokemonInfoPage> {
  @override
  void initState() {
    ref
        .read(pokemonInfoProvider.notifier)
        .fetchPokemonInfo(pokemonId: widget.pokemonId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final pokemonInfo = ref.watch(pokemonInfoProvider).pokemonInfo;
    final Color baseColor =
        getColorShade(pokemonInfoState.pokemonSpecies!.color);
    final innerGrowColor = baseColor.withValues(alpha: 0.5);
    return Scaffold(
      body: pokemonInfoState.isLoading
          ? CircularProgressIndicator()
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [innerGrowColor, baseColor, baseColor.darken(0.1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    0.6,
                    1,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      PokemonInfoHeader(pokemonInfo: pokemonInfo!),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
