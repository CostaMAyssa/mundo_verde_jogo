import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mundo_verde_game/screens/game/home_page.dart';
import 'package:mundo_verde_game/screens/game/mission_selection_screen.dart';
import 'package:mundo_verde_game/screens/game/game_story_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/menu/missions_screen.dart';
import 'screens/menu/profile_screen.dart';
import 'screens/menu/rewards_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Ativa o Device Preview
      builder: (context) => MyApp(), // App principal
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameTask',
      useInheritedMediaQuery: true, // Necessário para Device Preview
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
       '/story': (context) => GameStoryScreen(),
       '/avatar': (context) => MissionSelectionScreen(),
        '/game': (context) => HomePage(),
        '/missions': (context) => MissionsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/rewards': (context) => RewardsScreen(),
      },
      // Adiciona a integração com o Device Preview
      builder: DevicePreview.appBuilder,
    );
  }
}






