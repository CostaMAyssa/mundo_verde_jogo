import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mundo_verde_game/screens/game/button.dart';
import 'package:mundo_verde_game/screens/game/hero.dart';
import 'package:mundo_verde_game/screens/game/slime.dart';
import 'package:mundo_verde_game/screens/game/star.dart';
import 'package:mundo_verde_game/screens/menu/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int slimesToWin = 10; // Número de slimes que o jogador precisa derrotar para vencer
  int slimeSpriteCount = 1;
  static double slimePosX = 0.5;
  static double slimePosY = 1;
  String slimeDirection = 'left';
  int slimeDeathCount = 0;

  int heroSpriteCount = 1;
  double heroPosX = -0.5;
  double heroPosY = 1;
  String heroDirection = 'right';
  int attackHeroSpriteCount = 0;

  var loadingScreenColor = Colors.blue[300];
  var loadingScreenTextColor = Colors.blue[700];
  int loadingTime = 3;
  bool gameHasStarted = false;

  double starX = 2;
  double starY = 2;
  int starSprite = 0;

  int heroLives = 3; // Contador de vidas do herói
  List<Icon> hearts = []; // Lista de corações

  bool isHeroInvulnerable = false; // Controle de invulnerabilidade do herói

  void playNow() {
    setState(() {
      slimePosX = 0.5;
      slimePosY = 1;
      heroPosX = -0.5;
      heroPosY = 1;
      heroLives = 3; // Resetando as vidas do herói
      slimeDeathCount = 0; // Resetando o contador de mortes da slime
      hearts = List.generate(3, (index) => Icon(Icons.favorite, color: Colors.red)); // Inicializando os corações
    });
    startGameTimer();
    moveSlime();
    attack();
  }

  void startGameTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTime--;
      });
      if (loadingTime == 0) {
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingScreenTextColor = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }

  void attack() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        attackHeroSpriteCount++;
      });

      if (attackHeroSpriteCount == 5) {
        if (heroDirection == 'right' && heroPosX + 0.2 > slimePosX) {
          print('hit');
          showHitFeedback(); // Feedback visual de acerto
        } else {
          print('missed');
        }

        attackHeroSpriteCount = 0;
        timer.cancel();
        starFlies();
      }
    });
  }

  void showHitFeedback() {
    setState(() {
      slimeSpriteCount = 5; // Mudando a sprite da slime para um "hit"
    });
    Timer(Duration(milliseconds: 300), () {
      setState(() {
        slimeSpriteCount = 1; // Resetando a sprite da slime
      });
    });
  }

  void starFlies() {
    setState(() {
      starX = heroPosX + 0.1;
      starY = 0.9;
    });

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        starX += 0.5; // A estrela se move para a direita
        starSprite++; // Mudar a animação da estrela

        // Verificando colisão entre a estrela e a slime
        if ((starX - slimePosX).abs() < 0.1 && (starY - slimePosY).abs() < 0.1) {
          timer.cancel(); // Interrompe a animação da estrela
          killSlime(); // Mata a slime
        }
      });
    });
  }

  void killSlime() {
    setState(() {
      slimePosX = 2; // Coloca a slime fora da tela
      slimeSpriteCount = 1; // Reseta a sprite da slime
      slimeDeathCount++; // Incrementa o contador de mortes

      if (slimeDeathCount >= slimesToWin) {
        showVictoryDialog(); // Mostra a mensagem de vitória
      }
    });
  }

  void moveSlime() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        slimeSpriteCount++;

        if (slimePosX < heroPosX) {
          slimePosX += 0.01;
        } else if (slimePosX > heroPosX) {
          slimePosX -= 0.01;
        }

        checkCollision();

        if (slimeSpriteCount == 5) {
          slimeSpriteCount = 1;
        }
      });
    });
  }

  void checkCollision() {
    if ((slimePosX - heroPosX).abs() < 0.1 && (slimePosY - heroPosY).abs() < 0.1) {
      loseLife();
    }
  }

  void loseLife() {
    if (!isHeroInvulnerable) { // Verifica se o herói não está invulnerável
      if (heroLives > 1) {
        setState(() {
          heroLives--; // Perdendo uma vida
          hearts.removeAt(0); // Removendo um coração da lista
        });

        // Torna o herói invulnerável por 5 segundos
        isHeroInvulnerable = true;
        Timer(Duration(seconds: 5), () {
          setState(() {
            isHeroInvulnerable = false; // Remove a invulnerabilidade após 5 segundos
          });
        });
      } else {
        gameOver(); // Game Over
      }
    }
  }

  void gameOver() {
  setState(() {
    slimePosX = 0.5;
    slimePosY = 1;
    heroPosX = -0.5;
    heroPosY = 1;
    hearts.clear();
  });

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.red[300], // Cor de fundo da tela de derrota
        title: Text(
          'Game Over',
          style: TextStyle(color: Colors.white), // Cor do título
        ),
        content: Text(
          'Você perdeu todas as suas vidas!',
          style: TextStyle(color: Colors.white), // Cor do conteúdo
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              playNow(); // Reinicia o jogo
            },
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              'Reiniciar Jogo',
              style: TextStyle(color: Colors.white), // Cor do texto do botão
            ),
          ),
        ],
      );
    },
  );
}


  void showVictoryDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.green[300], // Cor de fundo da tela de vitória
        title: Text(
          'Você conseguiu salvar a floresta!',
          style: TextStyle(color: Colors.white), // Cor do título
        ),
        content: Text(
          'Parabéns, você derrotou todos os capangas do senhor Smogus! Prepare-se para sua próxima missão.',
          style: TextStyle(color: Colors.white), // Cor do conteúdo
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fecha o diálogo de vitória
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()), // Substitua pelo nome da sua tela de destino
              );
              print('Nova missão desbloqueada!'); // Aqui você pode adicionar qualquer lógica extra
            },
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              'Próxima Missão',
              style: TextStyle(color: Colors.white), // Cor do texto do botão
            ),
          ),
        ],
      );
    },
  );
}



  void moveLeft() {
    setState(() {
      heroPosX -= 0.03;
      heroDirection = 'left';
    });
  }

  void moveRight() {
    setState(() {
      heroPosX += 0.03;
      heroDirection = 'right';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue[300],
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment(slimePosX, 1),
                    child: SlimeGreen(this.slimeSpriteCount, this.slimeDirection),
                  ),
                  Container(
                    alignment: Alignment(heroPosX, 1),
                    child: MyHero(this.heroSpriteCount, this.heroDirection),
                  ),
                  Container(
                    alignment: Alignment(starX, starY),
                    child: Star(
                      starX: starX,
                      starY: starY,
                      starSprite: starSprite,
                    ),
                  ),
                  Container(
                    color: loadingScreenColor,
                    child: Center(
                      child: Text(loadingTime.toString(),
                          style: TextStyle(color: loadingScreenTextColor)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 50, left: 10),
                    child: Row(
                      children: hearts, // Exibindo os corações
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'M U N D O  V E R D E',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyButton(
                        text: 'PLAY',
                        function: playNow,
                      ),
                      MyButton(
                        text: 'ATTACK',
                        function: attack,
                      ),
                      MyButton(
                        text: '←',
                        function: moveLeft,
                      ),
                      MyButton(
                        text: '→',
                        function: moveRight,
                      ),
                    ],
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
