import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_bg.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_header.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_image.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_tabs.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_info_type_chip.dart';

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
    return Scaffold(
      body: pokemonInfoState.isLoading
          ? CircularProgressIndicator()
          : PokemonInfoBg(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SafeArea(
                  child: Column(
                    children: [
                      PokemonInfoHeader(pokemonInfo: pokemonInfo!),
                      SizedBox(height: 25),
                      PokemonInfoImage(
                        imageUrl: pokemonInfo.frontDefault,
                      ),
                      PokemonInfoTypeChip(
                        pokemonType: pokemonInfo.pokemonType,
                      ),
                      SizedBox(height: 30),
                      Expanded(child: PokemonInfoTabs()),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
