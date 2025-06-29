import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/core/router/routes.dart';
import 'package:riverpod_practice/features/pokemon_app/domain/entities/pokemon_by_type.dart';

class PokemonByTypeCard extends StatelessWidget {
  final PokemonByType pokemonByType;
  const PokemonByTypeCard({super.key, required this.pokemonByType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.pokemonInfo, extra: pokemonByType.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 4,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffa2d997),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Text(
                        "#${pokemonByType.id.toString()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Image.network(
                  pokemonByType.frontDefault,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/no_pokemon.png");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  pokemonByType.name,
                  style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.9),
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
