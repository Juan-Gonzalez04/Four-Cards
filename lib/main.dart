// Importá el paquete de Flutter necesario para cualquier app.
import 'package:flutter/material.dart';
import 'home_screen.dart';

// Punto de entrada de la app. Flutter arranca desde aquí.
// Llamá a runApp() pasándole tu widget raíz.
void main() {
  runApp(MyApp()); // Este widget va a representar toda tu app.
}

// Acá definí tu widget principal, extendiendo StatelessWidget.
// Es buena práctica que este widget devuelva un MaterialApp.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp es el contenedor general de la app.
    // Podés definir aquí el tema, rutas, etc.
    return MaterialApp(
      title: 'Dash',
      debugShowCheckedModeBanner: false, // Remueve la cinta de debug
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 18)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 211, 203, 179),
            foregroundColor: Colors.black,
            textStyle: TextStyle(fontSize: 20, fontFamily: 'ARCADE'),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      home: HomeScreen(), // Acá poné la pantalla inicial que vas a crear abajo.
    );
  }
}

// Ahora creá una nueva clase llamada HomeScreen que represente la pantalla de inicio.
// Extendela desde StatelessWidget y usá un Scaffold con un AppBar y algo de contenido.
