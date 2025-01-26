import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importação do Google Fonts
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFF80C080), 
        Color(0xFF007F00), 
         Color(0xFF80C080),], // Tons de verde
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 90),
                Text(
                  "Mundo Verde",
                  style: GoogleFonts.rajdhani(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'lib/image/logo.png', // Substitua pelo caminho correto da sua logo
                  height: 175,
                  width: 175,
                ),
                SizedBox(height: 20),
                // Texto animado letra por letra
                SizedBox(
                  width: 300,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Jogue e transforme o mundo',
                        textStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 100), // Velocidade de digitação
                      ),
                    ],
                    isRepeatingAnimation: false, // Exibe apenas uma vez
                  ),
                ),
                SizedBox(height: 20),
                // Container com borda incluindo os inputs e o botão
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      // Campo de Nome de Usuário
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Nome de Usuário*",
                            labelStyle: GoogleFonts.rajdhani(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: GoogleFonts.rajdhani(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Campo de Senha
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Senha*",
                            labelStyle: GoogleFonts.rajdhani(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          obscureText: true,
                          style: GoogleFonts.rajdhani(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Botão
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/story'); // Altere para a rota correta
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
                            "Entrar no Mundo Verde",
                            style: GoogleFonts.rajdhani(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      // Link "Cadastrar-se"
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register'); // Altere para a rota correta
                        },
                        child: Text(
                          "Cadastrar-se",
                          style: GoogleFonts.rajdhani(
                            color: Colors.white,
                            fontSize: 12,
                          ),
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
    );
  }
}
