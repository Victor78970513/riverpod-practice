import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_types_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_type_widget.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/shimmers/pokemon_types_shimmer.dart';

class PokemonTypesPage extends ConsumerStatefulWidget {
  const PokemonTypesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonTypesPageState();
}

class _PokemonTypesPageState extends ConsumerState<PokemonTypesPage> {
  @override
  void initState() {
    ref.read(pokemonTypesProvider.notifier).fetchAllPokemonTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonTypesState = ref.watch(pokemonTypesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Type"),
      ),
      body: pokemonTypesState.isLoading
          ? PokemonTypesShimmer()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 65,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: pokemonTypesState.pokemonTypes.length,
                itemBuilder: (context, index) {
                  final pokemonType = pokemonTypesState.pokemonTypes[index];
                  return PokemonTypeWidget(
                    pokemonType: pokemonType,
                  );
                },
              ),
            ),
    );
  }
}
