import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_types_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_type_widget.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Type"),
      ),
      body: pokemonTypesState.isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  spacing: 10.0,
                  children: List.generate(
                    pokemonTypesState.pokemonTypes.length,
                    (index) {
                      final pokemonType = pokemonTypesState.pokemonTypes[index];
                      return PokemonTypeWidget(
                        width: size.width * 0.45,
                        pokemonType: pokemonType,
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
