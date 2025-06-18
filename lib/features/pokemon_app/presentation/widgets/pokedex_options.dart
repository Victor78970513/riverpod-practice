import 'package:flutter/material.dart';
import 'package:riverpod_practice/features/pokemon_app/presentation/widgets/pokedex_menu_button.dart';

class PokedexOptionsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;

    path.moveTo(0, size.height * 0.15);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.15);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * -0.1,
      0,
      size.height * 0.15,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PokedexOptionsPainter oldDelegate) => false;
}

class PokedexOptions extends StatelessWidget {
  const PokedexOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: PokedexOptionsPainter(),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              PokedexMenuButton(
                text: "Types",
                color: Color(0xff9fda93),
                icon: Icons.sports_soccer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
