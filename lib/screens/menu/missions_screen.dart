// missions_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> missions = [
    {"name": "Criar carrinho de caixa de leite", "reward": "50 XP"},
    {"name": "Construir um banco de garrfa pet", "reward": "100 XP"},
  ];

  final List<Map<String, dynamic>> helpfulContent = [
    {"title": "Como reciclar corretamente", "type": "Dica"},
    {"title": "Construção de brinquedos com material reciclável", "type": "Vídeo"},
    {"title": "Guia de sustentabilidade", "type": "Artigo"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6DAF6E), Color(0xFF4CAF50), Color(0xFF80C080)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                AppBar(
                  title: Text(
                    "Missões - EcoHeroes",
                    style: GoogleFonts.rajdhani(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                SizedBox(height: 5),
                // Lista de Missões
                Text(
                  "Missões para Salvar Pollutopolis",
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                ...missions.map((mission) {
                  return Card(
                    color: Colors.green[100],
                    child: ListTile(
                      title: Text(
                        mission["name"],
                        style: GoogleFonts.rajdhani(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Recompensa: ${mission["reward"]}",
                        style: GoogleFonts.rajdhani(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            "Começar",
                            style: GoogleFonts.rajdhani(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
                // Conteúdo que pode ajudar
                Text(
                  "Conteúdo para Ajudar na Missão",
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                ...helpfulContent.map((content) {
                  return Card(
                    color: Colors.green[100],
                    child: ListTile(
                      title: Text(
                        content["title"],
                        style: GoogleFonts.rajdhani(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Tipo: ${content["type"]}",
                        style: GoogleFonts.rajdhani(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.green[800],
                      ),
                      onTap: () {
                        // Adicione lógica para abrir o conteúdo
                      },
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
