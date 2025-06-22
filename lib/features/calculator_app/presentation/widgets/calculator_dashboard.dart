import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/provider/calculator_provider.dart';

class CalculatorDashboard extends ConsumerWidget {
  const CalculatorDashboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final resultValue = ref.watch(resultProvider);
    final lastOperation = ref.watch(lastOperationProvider);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lastOperation,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 40,
            ),
          ),
          Text(
            resultValue,
            style: TextStyle(
              color: Colors.white,
              fontSize: 96,
            ),
          ),
        ],
      ),
    );
  }
}
