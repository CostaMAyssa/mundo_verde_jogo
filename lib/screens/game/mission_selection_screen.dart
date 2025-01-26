import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mundo_verde_game/screens/game/home_page.dart';


class MissionSelectionScreen extends StatefulWidget {
  @override
  _MissionSelectionScreenState createState() => _MissionSelectionScreenState();
}

class _MissionSelectionScreenState extends State<MissionSelectionScreen> {
  String? _selectedMission;

  final List<Map<String, String>> _missions = [
    {
      'name': 'Floresta em Perigo',
      'description': 'As bolhas da poluição do Senhor Smogus está destruindo a floresta',
      'imagePath': 'lib/image/floresta.png',
    },
    {
      'name': 'Praia Poluída',
      'description': 'Limpe a praia e proteja a vida marinha das Bolhas Tóxicas!',
      'imagePath': 'lib/image/bloqueado.png',
    },
    {
      'name': 'Rio Contaminado',
      'description': 'Purifique o rio e recupere sua fauna e flora aquática!',
      'imagePath': 'lib/image/bloqueado.png',
    },
    {
      'name': 'Parque Abandonado',
      'description': 'Restaure o parque e devolva a alegria para a comunidade!',
      'imagePath': 'lib/image/bloqueado.png',
    },
  ];

  void _selectMission(String mission) {
    setState(() {
      _selectedMission = mission;
      print('Missão selecionada: $_selectedMission'); // Log para debug
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'Você selecionou: $mission. Deslize para desfazer.',
          style: GoogleFonts.rajdhani(
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _selectedMission = null;
              print('Seleção desfeita'); // Log para debug
            });
          },
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80C080),
              Color(0xFF007F00),
              Color(0xFF80C080),
            ], // Tons de verde
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                'Escolha sua missão:',
                style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0),
              Expanded(
                child: ListView(
                  children: _missions.map((mission) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0), // Adiciona espaçamento entre os cards
                      child: GestureDetector(
                        onTap: () => _selectMission(mission['name']!),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF007F00), Color(0xFF005900)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    mission['imagePath']!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mission['name']!,
                                          style: GoogleFonts.rajdhani(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          mission['description']!,
                                          style: GoogleFonts.rajdhani(
                                            fontSize: 14,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (_selectedMission != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: _navigateToHomePage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Iniciar Missão',
                      style: GoogleFonts.rajdhani(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
