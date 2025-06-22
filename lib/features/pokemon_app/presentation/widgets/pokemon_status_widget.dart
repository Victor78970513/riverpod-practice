import 'package:flutter/material.dart';

class PokemonStatusWidget extends StatelessWidget {
  final String title;
  final double statusValue;
  final Color statusColor;
  const PokemonStatusWidget({
    super.key,
    required this.title,
    required this.statusValue,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxStatValue = size.width * 0.7;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: size.width,
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Color(0xffe7e7e7),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: (maxStatValue * (statusValue / 100))
                          .clamp(0, size.width * 0.7),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        "${statusValue.toInt()}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
