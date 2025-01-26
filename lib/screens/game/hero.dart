import 'package:flutter/material.dart';
import 'dart:math';

class MyHero extends StatelessWidget {
  final int heroSpriteCount;
  final String heroDirection;

  const MyHero(this.heroSpriteCount, this.heroDirection);

  @override
  Widget build(BuildContext context) {
    int directionAsInt = heroDirection == 'right' ? 1 : 0;

    return Container(
      alignment: Alignment.bottomCenter,
      height: 100,
      width: 100,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi * directionAsInt),
        child: Image.asset(
          'lib/image/hero.png', // Corrigido para hero.png
        ),
      ),
    );
  }
}
