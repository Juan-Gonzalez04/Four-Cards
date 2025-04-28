import 'package:flutter/material.dart';
import 'play_screen.dart';
import 'carrer_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              RetroButton(
                label: 'JUGAR',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayScreen()),
                  );
                },
                fontSize: 25,
              ),
              SizedBox(height: 10),
              RetroButton(
                label: 'CARRERA',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarrerScreen()),
                  );
                },
                fontSize: 18,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RetroButton(
                    label: 'PERFIL',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    fontSize: 15,
                  ),
                  SizedBox(width: 10),
                  RetroIconButton(
                    icon: Icons.settings,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    iconSize: 40,
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RetroButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const RetroButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Color(0xFFC8461B),
          border: Border.all(color: Colors.yellow.shade700, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.6 * 255).round()),
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.yellow.shade200,
            fontFamily: 'ARCADE',
            shadows: [Shadow(offset: Offset(3.5, 3.5), color: Colors.black)],
          ),
        ),
      ),
    );
  }
}

class RetroIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const RetroIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 30,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Color(0xFFC8461B),
          border: Border.all(color: Colors.yellow.shade700, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.6 * 255).round()),
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: Colors.yellow.shade200,
          shadows: [Shadow(offset: Offset(2, 2), color: Colors.black)],
        ),
      ),
    );
  }
}
