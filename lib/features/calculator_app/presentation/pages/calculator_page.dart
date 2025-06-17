import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/provider/calculator_provider.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/widgets/calculator_button.dart';
import 'package:riverpod_practice/features/calculator_app/presentation/widgets/calculator_dashboard.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final delStr = String.fromCharCode(127);
    return Scaffold(
      backgroundColor: Color(0xff17171C),
      body: Column(
        children: [
          CalculatorDashboard(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(color: Color(0xff4E505F), text: 'C'),
                    CalculatorButton(color: Color(0xff4E505F), text: '+/-'),
                    CalculatorButton(color: Color(0xff4E505F), text: '%'),
                    CalculatorButton(color: Color(0xff4B5EFC), text: '÷'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(color: Color(0xff2E2F38), text: '7'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '8'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '9'),
                    CalculatorButton(color: Color(0xff4B5EFC), text: 'x'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(color: Color(0xff2E2F38), text: '4'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '5'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '6'),
                    CalculatorButton(color: Color(0xff4B5EFC), text: '-'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(color: Color(0xff2E2F38), text: '1'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '2'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '3'),
                    CalculatorButton(color: Color(0xff4B5EFC), text: '+'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(color: Color(0xff2E2F38), text: '.'),
                    CalculatorButton(color: Color(0xff2E2F38), text: '0'),
                    CalculatorButton(color: Color(0xff2E2F38), text: delStr),
                    CalculatorButton(
                        color: Color(0xff4B5EFC),
                        text: '=',
                        onTap: () {
                          Parser p = Parser();
                          Expression exp = p.parse(ref.read(resultProvider));
                          ContextModel cm = ContextModel();
                          final result = exp.evaluate(EvaluationType.REAL, cm);
                          ref.read(lastOperationProvider.notifier).state =
                              ref.read(resultProvider);
                          ref.read(resultProvider.notifier).state =
                              result.toString();
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
