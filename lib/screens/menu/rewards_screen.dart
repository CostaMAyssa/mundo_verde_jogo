// rewards_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardsScreen extends StatelessWidget {
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
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.recycling, color: Colors.white),
              title: Text(
                "Reciclagem de Materiais",
                style: GoogleFonts.rajdhani(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                "Troque materiais recicláveis por pontos.",
                style: GoogleFonts.rajdhani(color: Colors.white70, fontSize: 14),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), 
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  "Resgatar",
                  style: GoogleFonts.rajdhani(color: Color(0xFF00008B)),
                ),
              ),
            ),
            Divider(color: Colors.white24),
            ListTile(
              leading: Icon(Icons.nature_people, color: Colors.white),
              title: Text(
                "Vale Verde",
                style: GoogleFonts.rajdhani(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                "Um prêmio para cada missão ecológica completada.",
                style: GoogleFonts.rajdhani(color: Colors.white70, fontSize: 14),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  "Resgatar",
                  style: GoogleFonts.rajdhani(color: Color(0xFF00008B)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
