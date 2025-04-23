import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                print("PANTALLA JUGAR");
                //LLAMAR A JUGAR
            },
            child: Text('JUGAR'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print("PANTALLA CARRERA");
                //LLAMAR A MODO CARRERA
            },
            child: Text('CARRERA'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print("PANTALLA OPCIONES");
                //LLAMAR A OPCIONES
            },
            child: Text('OPCIONES'),
            ),
          ],
      ),
      )
    );
  }
}
