import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/core/router/router.dart';
import 'package:riverpod_practice/features/pokemon_app/data/datasources/pokedex_remote_datasource.dart';
import 'package:riverpod_practice/features/pokemon_app/data/repositories/pokedex_repository_impl.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/pokedex_repository_provider.dart';

void main() => runApp(
      ProviderScope(
        overrides: [
          pokedexRepositoryProvider.overrideWithValue(
            PokedexRepositoryImpl(
              remoteDatasource: PokedexRemoteDatasourceImpl(),
            ),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
    );
  }
}
