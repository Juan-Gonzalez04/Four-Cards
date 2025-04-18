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
      home: HomeScreen(), // Acá poné la pantalla inicial que vas a crear abajo.
    );
  }
}

// Ahora creá una nueva clase llamada HomeScreen que represente la pantalla de inicio.
// Extendela desde StatelessWidget y usá un Scaffold con un AppBar y algo de contenido.
