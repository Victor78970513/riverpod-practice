import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemons_by_type_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokemon_by_type_card.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/shimmers/pokemons_by_type_shimmer.dart';

class PokemonsByTypePage extends ConsumerStatefulWidget {
  final String type;
  const PokemonsByTypePage(this.type, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonsByTypePageState();
}

class _PokemonsByTypePageState extends ConsumerState<PokemonsByTypePage> {
  @override
  void initState() {
    ref
        .read(pokemonsByTypeProvider.notifier)
        .fetchPokemonsByType(type: widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonsByTypeState = ref.watch(pokemonsByTypeProvider);
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 20),
                Text(
                  "${widget.type} type",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ],
            ),
            pokemonsByTypeState.isLoading
                ? Expanded(
                    child: PokemonsByTypeShimmer(),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: pokemonsByTypeState.pokemonsByType.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final pokemonByType =
                            pokemonsByTypeState.pokemonsByType[index];
                        return PokemonByTypeCard(pokemonByType: pokemonByType);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
