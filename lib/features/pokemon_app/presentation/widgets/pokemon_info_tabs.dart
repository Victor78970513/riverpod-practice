import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/utils/pokemon_color.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_about_view.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_moves_view.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_status_view.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokemon_info_provider.dart';

class PokemonInfoTabs extends ConsumerStatefulWidget {
  const PokemonInfoTabs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonInfoTabsState();
}

class _PokemonInfoTabsState extends ConsumerState<PokemonInfoTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonInfoState = ref.watch(pokemonInfoProvider);
    final Color baseColor =
        getColorShade(pokemonInfoState.pokemonSpecies!.color);
    final chipColor = baseColor.withValues(alpha: 0.8);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: baseColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(30)),
          child: TabBar(
            controller: _tabController,
            onTap: (value) => setState(() {}),
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: chipColor,
              borderRadius: _tabController.index == 0
                  ? BorderRadius.horizontal(left: Radius.circular(30))
                  : _tabController.index == 1
                      ? BorderRadius.circular(0)
                      : BorderRadius.horizontal(
                          right: Radius.circular(30),
                        ),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade700,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "About",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Moves",
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              PokemonAboutView(
                  pokemonInfo: pokemonInfoState.pokemonInfo!,
                  pokemonSpecies: pokemonInfoState.pokemonSpecies!),
              PokemonStatusView(pokemonInfo: pokemonInfoState.pokemonInfo!),
              PokemonMovesView(
                  pokemonMoves: pokemonInfoState.pokemonInfo!.pokemonMoves)
            ],
          ),
        ),
      ],
    );
  }
}
