import 'package:flutter/material.dart';
import 'widgets_custom.dart';

class CarrerScreen extends StatelessWidget {
  const CarrerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JUGAR')),
      body: Center(child: Text('PANTALLA "CARRERA"')),
    );
  }
}
