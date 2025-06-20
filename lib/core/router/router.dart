import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/core/router/routes.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/pages/calculator_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokedex_menu_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_home_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemon_types_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pages/pokemons_by_type_page.dart';
import 'package:riverpod_practice/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.menuPage,
      builder: (context, state) {
        return MenuPage();
      },
    ),
    GoRoute(
      path: AppRoutes.calculador,
      builder: (context, state) {
        return CalculatorPage();
      },
    ),
    GoRoute(
      path: AppRoutes.pokedex,
      builder: (context, state) {
        return PokedexMenuPage();
      },
    ),
    GoRoute(
      path: AppRoutes.pokedexTypes,
      builder: (context, state) {
        return PokemonTypesPage();
      },
    ),
    GoRoute(
      path: AppRoutes.pokemonsByType,
      builder: (context, state) {
        final type = state.extra as String;
        return PokemonsByTypePage(type);
      },
    ),
    GoRoute(
      path: AppRoutes.pokemonInfo,
      builder: (context, state) {
        final pokemonId = state.extra as int;
        return PokemonHomePage(pokemonId: pokemonId);
        // return PokemonInfoPage(pokemonId);
      },
    )
  ],
);
