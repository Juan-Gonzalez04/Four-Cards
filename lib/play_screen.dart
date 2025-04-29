import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';
import 'package:four_cards/l10n/app_localizations.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RetroAppBar(title: AppLocalizations.of(context).play),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 250),
              RetroButton(
                label: AppLocalizations.of(context).private,
                onPressed: () {
                  print('PARTIDA PRIVADA');
                },
              ),
              SizedBox(height: 50),
              RetroButton(
                label: AppLocalizations.of(context).public,
                onPressed: () {
                  print('PARTIDA PUBLICA');
                },
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RetroButton(
                    label: AppLocalizations.of(context).scoreboard,
                    onPressed: () {
                      print('PANTALLA MARCADOR');
                    },
                    fontSize: 10,
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
