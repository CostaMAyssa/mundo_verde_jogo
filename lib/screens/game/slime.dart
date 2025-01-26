import 'package:flutter/material.dart';
import 'dart:math';

class SlimeGreen extends StatelessWidget {
  final int slimeSpriteCount;
  final String slimeDirection;

  const SlimeGreen(this.slimeSpriteCount, this.slimeDirection);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 100,
      width: 100,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(slimeDirection == 'right' ? pi : 0),
        child: Image.asset(
          'lib/image/Slime' + slimeSpriteCount.toString() + '.png',
        ),
      ),
    );
  }
}
