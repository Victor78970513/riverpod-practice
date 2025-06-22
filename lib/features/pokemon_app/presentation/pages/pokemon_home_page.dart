import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_evolutions_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_info_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/custom_navigation_bar.dart';

class PokemonHomePage extends ConsumerWidget {
  final int pokemonId;
  const PokemonHomePage({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final indexBottomNavigationBar = ref.watch(bottomNavigationBarProvider);
    final pages = [
      PokemonInfoPage(pokemonId),
      PokemonEvolutionsPage(),
      const Center(
        child: Text('Hello From Settings'),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: Expanded(
        child: IndexedStack(
          index: indexBottomNavigationBar,
          children: pages,
        ),
      ),
    );
  }
}
