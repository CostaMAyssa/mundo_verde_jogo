import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('lib/image/avatar.png'), // Avatar do jogador
              ),
              SizedBox(height: 5),
              Text(
                "EcoHerói: Criador Sustentável",
                style: GoogleFonts.rajdhani(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Nível: 15",
                style: GoogleFonts.rajdhani(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.75,
                minHeight: 8,
                backgroundColor: Colors.white,
                color: Colors.green,
              ),
              SizedBox(height: 5),
              Text(
                "Experiência: 1500/2000",
                style: GoogleFonts.rajdhani(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, 
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 6, 
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Lógica para selecionar item
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('lib/image/item_$index.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF80C080)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Personalizar Avatar",
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
