import 'package:flutter/material.dart';
import 'main.dart';
import 'play_screen.dart';
import 'carrer_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import 'package:four_cards/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;

  const HomeScreen({super.key, required this.onLanguageChanged});

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
                label: AppLocalizations.of(context).play,
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
                label: AppLocalizations.of(context).career,
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
                    label: AppLocalizations.of(context).profile,
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
                          builder:
                              (context) => SettingsScreen(
                                onLanguageChanged: onLanguageChanged,
                              ),
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
