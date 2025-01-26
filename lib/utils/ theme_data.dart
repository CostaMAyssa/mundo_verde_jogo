// cores  para reutilização

import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFFF4676), // Rosa vibrante
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
  ).copyWith(
    secondary: Color(0xFF73D0FF), // Azul claro brilhante
    surface: Color(0xFF1E1E2C), // Preto suave
  ),
  scaffoldBackgroundColor: Color(0xFF1E1E2C), // Fundo para Scaffold
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Texto padrão
    headlineLarge: TextStyle(color: Color(0xFFFF4676)), // Rosa para títulos
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFF4676), // Botões principais
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
);
