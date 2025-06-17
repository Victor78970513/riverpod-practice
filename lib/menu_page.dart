import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/core/router/routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Riverpod Practice",
          style: TextStyle(
            color: Color(0xff121417),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuItem(
            text: 'Calculadora',
            path: AppRoutes.calculador,
          ),
          MenuItem(
            text: 'Pokedex',
            path: AppRoutes.pokedex,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final String path;
  const MenuItem({super.key, required this.text, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(path);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffDBE8F2),
            borderRadius: BorderRadius.circular(12),
          ),
          width: double.infinity,
          height: 48,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Color(0xff121417),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
