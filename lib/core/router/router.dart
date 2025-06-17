import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/core/router/routes.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/pages/calculator_page.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/pokedex_page.dart';
import 'package:riverpod_practice/menu_page.dart';

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
        return PokedexPage();
      },
    )
  ],
);
