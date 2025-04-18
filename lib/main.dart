import 'package:flutter/material.dart';

// 1. Definir una clase para la pantalla de inicio
// - La clase de esta pantalla debe extender de StatelessWidget ya que no tiene estado que cambiar.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 2. Utilizar un Scaffold como base para tu pantalla
    // - Scaffold proporciona una estructura visual básica con AppBar, Body, Drawer, etc.
    return Scaffold(
      // 3. Crear un AppBar
      // - El AppBar es una barra en la parte superior de la pantalla, usualmente contiene el título o las acciones.
      // - Aquí, ponemos el título del juego, pero puedes personalizarlo más si lo deseas.
      appBar: AppBar(
        title: Text('DASH'),  // Título de la pantalla
      ),

      // 4. Crear el cuerpo de la pantalla usando un widget de tipo Column
      // - Column te permite alinear los widgets verticalmente.
      // - Lo usaremos para colocar varios botones y otros widgets en la pantalla de inicio.
      body: Column(
        // 5. Alinear los elementos al centro de la pantalla
        // - `MainAxisAlignment.center` asegura que los widgets se alineen verticalmente en el centro.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 6. Agregar un logo o imagen (opcional, pero común en las pantallas de inicio)
          // - Puedes agregar una imagen de tu logo usando `Image.asset`.
          // - Primero, guarda la imagen en la carpeta `assets/images/` y declárala en `pubspec.yaml`.
          Image.asset('assets/images/logo.png'), // Cambia el nombre de la imagen según lo que tengas

          // 7. Crear un botón para iniciar el juego
          // - Un botón puede ser creado usando `ElevatedButton`.
          // - Usamos la función `onPressed` para definir lo que sucede cuando se presiona el botón.
          ElevatedButton(
            onPressed: () {
              // 8. Definir qué pasa cuando el botón es presionado
              // - Queremos navegar a la pantalla del juego.
              // - Para eso, usamos `Navigator.push` que cambia de pantalla.
              Navigator.push(
                context,  // Contexto necesario para la navegación
                MaterialPageRoute(builder: (context) => GameScreen()),  // Navega a la pantalla GameScreen (que aún tienes que crear)
              );
            },
            child: Text('Iniciar Juego'), // El texto que aparecerá en el botón
          ),

          // 9. Crear otro botón para ir a la pantalla de opciones (si decides tenerla)
          // - Similar al anterior, puedes usar otro `ElevatedButton` para navegar a las opciones.
          ElevatedButton(
            onPressed: () {
              // 10. Navegar a la pantalla de opciones
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OptionsScreen()),  // Reemplaza OptionsScreen con la clase correspondiente
              );
            },
            child: Text('Opciones'),  // El texto que aparecerá en el botón
          ),

          // 11. Crear un botón para ir a la pantalla de estadísticas (opcional)
          // - De nuevo, este botón te llevará a una pantalla de estadísticas.
          ElevatedButton(
            onPressed: () {
              // 12. Navegar a la pantalla de estadísticas
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatsScreen()),  // Reemplaza StatsScreen con la clase de estadísticas
              );
            },
            child: Text('Perfil'),
          ),
        ],
      ),
    );
  }
}
