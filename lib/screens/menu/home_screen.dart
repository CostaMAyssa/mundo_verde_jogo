// home_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'missions_screen.dart'; // Importa sua tela de missões
import 'profile_screen.dart';  // Importa sua tela de perfil
import 'rewards_screen.dart';  // Importa sua tela de recompensas

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF80C080), 
        Color(0xFF007F00), 
         Color(0xFF80C080),],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
  "Parabéns, jogador! Você completou sua missão anterior e está pronto para desbloquear novas atividades épicas no GameTask!",
  style: GoogleFonts.rajdhani(fontSize: 20, color: Colors.white),
),

                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 0.5, // Progresso do XP (de 0 a 1)
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(Colors.green),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.green,
                  labelStyle: GoogleFonts.rajdhani(fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: GoogleFonts.rajdhani(fontSize: 14),
                  tabs: [
                    Tab(text: "Missões"),
                    Tab(text: "Perfil"),
                    Tab(text: "Recompensas"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      MissionsScreen(), // Substitua pelo nome da sua classe
                      ProfileScreen(),  // Substitua pelo nome da sua classe
                      RewardsScreen(),  // Substitua pelo nome da sua classe
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
