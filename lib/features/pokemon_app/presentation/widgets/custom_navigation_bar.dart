import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/providers/bottom_navigation_bar_provider.dart';

class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final indexBottomNavigationBar =
        ref.watch(bottomNavigationBarProvider.notifier);
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () =>
                  indexBottomNavigationBar.update((value) => value = 0),
              icon: Icon(
                Icons.catching_pokemon,
                size: 30,
              )),
          IconButton(
              onPressed: () =>
                  indexBottomNavigationBar.update((value) => value = 1),
              icon: Icon(
                Icons.loop_outlined,
                size: 30,
              )),
          IconButton(
              onPressed: () =>
                  indexBottomNavigationBar.update((value) => value = 2),
              icon: Icon(
                Icons.location_on_rounded,
                size: 30,
              ))
        ],
      ),
    );
  }
}
