import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF73D0FF), Color(0xFFFF4676)],
        ),
      ),
      child: Center(
        child: Text(
          'GameTask',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
