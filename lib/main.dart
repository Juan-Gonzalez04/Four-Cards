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
class RetroButton extends StatefulWidget {
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
  RetroButtonState createState() => RetroButtonState();
}

class RetroButtonState extends State<RetroButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: widget.padding,
        transform:
            _isPressed
                ? Matrix4.translationValues(2, 2, 0)
                : Matrix4.identity(),
        decoration: BoxDecoration(
          color:
              _isPressed
                  ? Color(0xFFC8461B).withOpacity(0.8)
                  : Color(0xFFC8461B),
          border: Border.all(color: Colors.yellow.shade700, width: 4),
          boxShadow:
              _isPressed
                  ? []
                  : [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.6 * 255).round()),
                      offset: Offset(4, 4),
                    ),
                  ],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.yellow.shade200,
            fontFamily: 'ARCADE',
            shadows: [Shadow(offset: Offset(2, 2), color: Colors.black)],
          ),
        ),
      ),
    );
  }
}

class RetroIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const RetroIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 30,
    this.padding = const EdgeInsets.all(12),
  }) : super(key: key);

  @override
  State<RetroIconButton> createState() => _RetroIconButtonState();
}

class _RetroIconButtonState extends State<RetroIconButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Para mantener fondo transparente
      child: InkWell(
        onTap: widget.onPressed,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        borderRadius: BorderRadius.circular(
          8,
        ), // Un pequeño radio para splash correcto
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              color: const Color(0xFFC8461B),
              border: Border.all(color: Colors.yellow.shade700, width: 4),
              boxShadow:
                  _isPressed
                      ? []
                      : [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.6 * 255).round()),
                          offset: const Offset(4, 4),
                        ),
                      ],
            ),
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: Colors.yellow.shade200,
              shadows: const [
                Shadow(offset: Offset(2, 2), color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RetroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const RetroAppBar({super.key, required this.title, this.centerTitle = true});

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
