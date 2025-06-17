import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/provider/calculator_provider.dart';

class CalculatorButton extends ConsumerWidget {
  final Color color;
  final String text;
  final Function()? onTap;
  const CalculatorButton({
    super.key,
    required this.color,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: onTap ??
          () {
            ref.read(resultProvider.notifier).update((state) => state + text);
          },
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
