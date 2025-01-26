import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double starX;
  final double starY;
  final int starSprite;

  const Star({
    required this.starX,
    required this.starY,
    required this.starSprite,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(starX, starY),
      child: SizedBox(
        height: 80,
        width: 80,
        child: Image.asset(
          'lib/image/star1.png', // Caminho da imagem da estrela
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
