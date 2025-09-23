import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const OnicEsportsApp());
}

class OnicEsportsApp extends StatelessWidget {
  const OnicEsportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONIC Esports Management',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat', // Contoh penggunaan custom font
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}