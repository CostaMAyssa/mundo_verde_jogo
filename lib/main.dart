import 'package:flutter/material.dart';
import 'package:mundo_verde_game/screens/game/home_page.dart';
import 'package:mundo_verde_game/screens/game/mission_selection_screen.dart';
import 'package:mundo_verde_game/screens/game/game_story_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/menu/missions_screen.dart';
import 'screens/menu/profile_screen.dart';
import 'screens/menu/rewards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameTask',
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
    );
  }
}






