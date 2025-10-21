import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart'; // Import library Provider
import 'screens/splash_screen.dart';
import 'providers/team_provider.dart'; // Import provider yang kita buat

void main() {
  // Menyiapkan format tanggal untuk library intl
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      // 1. MEMBUNGKUS APLIKASI DENGAN ChangeNotifierProvider
      // Ini membuat TeamProvider tersedia di seluruh aplikasi
      ChangeNotifierProvider(
        create: (context) => TeamProvider(),
        child: const OnicEsportsApp(),
      ),
    );
  });
}

class OnicEsportsApp extends StatelessWidget {
  const OnicEsportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONIC Esports Marketplace', // Judul diubah sesuai tema baru
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

