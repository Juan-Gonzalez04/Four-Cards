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
  const MyApp({super.key});

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

//WIDGETS ADICIONALES
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

class RetroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const RetroAppBar({Key? key, required this.title, this.centerTitle = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          Navigator.canPop(context)
              ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.yellow.shade300),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ARCADE',
          fontSize: 28,
          color: Colors.yellow.shade300,
          shadows: [
            Shadow(blurRadius: 2, offset: Offset(2, 2), color: Colors.black),
          ],
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen.shade300, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
