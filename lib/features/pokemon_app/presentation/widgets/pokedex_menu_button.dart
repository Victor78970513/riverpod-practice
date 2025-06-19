import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokedexMenuButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final String path;
  const PokedexMenuButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: () => context.push(path),
        child: Container(
          width: double.infinity,
          height: 65,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 34,
              )
            ],
          ),
        ),
      ),
    );
  }
}
