import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';

class PlayScreen extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
      ),
    );
  }
}
