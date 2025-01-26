import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameStoryScreen extends StatefulWidget {
  @override
  _GameStoryScreenState createState() => _GameStoryScreenState();
}

class _GameStoryScreenState extends State<GameStoryScreen> {
 final List<String> _storyTexts = [
  'Bem-vindo a Pollutopolis, uma cidade que já foi cheia de vida, mas agora está sendo destruída pela poluição causada por Smogus, o Lorde da Poluição.',
  'O ar está pesado, as ruas estão tomadas por lixo e os habitantes perderam a esperança. Mas você, um EcoHerói, pode mudar isso!',
  'Sua missão é clara: colete materiais recicláveis no mundo real, derrote as Bolhas Tóxicas e combata Smogus para restaurar a vida e a esperança em Pollutopolis.',
  'Ao derrotar Smogus, você desbloqueará um incrível tutorial que ensina a usar os materiais recicláveis que você coletou para construir objetos incríveis no mundo real.',
  'Esses objetos não só fazem a diferença no jogo, mas também mostram como cada ação pode impactar positivamente o planeta. O futuro de Pollutopolis – e do mundo – está em suas mãos, EcoHerói!',
];


  final List<String> _displayedTexts = []; // Frases exibidas na tela
  String _currentTypingText = ''; // Texto sendo exibido letra por letra no momento

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    for (int i = 0; i < _storyTexts.length; i++) {
      String currentSentence = _storyTexts[i];
      for (int j = 0; j < currentSentence.length; j++) {
        setState(() {
          _currentTypingText = currentSentence.substring(0, j + 1);
        });
        await Future.delayed(Duration(milliseconds: 50)); // Delay entre letras
      }
      // Quando a frase é completada, adicioná-la ao `_displayedTexts` e limpar `_currentTypingText`
      setState(() {
        _displayedTexts.add(currentSentence);
        _currentTypingText = '';
      });
      await Future.delayed(Duration(seconds: 1)); // Pausa antes de começar a próxima frase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF80C080), 
        Color(0xFF007F00), 
         Color(0xFF80C080),
        ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Conteúdo principal centralizado
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Mundo Verde',
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Área de exibição das frases
                  ..._displayedTexts.map(
                    (text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rajdhani(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (_currentTypingText.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        _currentTypingText,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rajdhani(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/avatar'); // Rota para o próximo passo
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.green[800],
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        "Começar a Aventura",
                        style: GoogleFonts.rajdhani(
                          fontSize: 15,
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
        ],
      ),
    );
  }
}
