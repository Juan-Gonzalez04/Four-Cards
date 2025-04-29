import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RetroAppBar(title: 'JUGAR'),

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
                label: 'PRIVADA',
                onPressed: () {
                  print('PARTIDA PRIVADA');
                },
              ),
              SizedBox(height: 50),
              RetroButton(
                label: 'PUBLICA',
                onPressed: () {
                  print('PARTIDA PUBLICA');
                },
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RetroButton(
                    label: 'MARCADOR',
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
