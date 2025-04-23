import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  print("PANTALLA JUGAR");
                  //LLAMAR A JUGAR
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 30, fontFamily: 'ARCADE'),
                ),
                child: Text('JUGAR'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print("PANTALLA CARRERA");
                  //LLAMAR A MODO CARRERA
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 25, fontFamily: 'ARCADE'),
                ),
                child: Text('CARRERA'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("PANTALLA DE PERFIL");
                      //LLAMAR A PERFIL
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18, fontFamily: 'ARCADE'),
                    ),
                    child: Text('PERFIL'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("PANTALLA OPCIONES");
                      //LLAMAR A OPCIONES
                    },
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(5)),
                    child: Icon(Icons.settings, size: 50),
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
