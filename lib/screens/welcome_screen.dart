import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import '../config/app_router.dart'; // Import file konfigurasi rute

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Pengaturan animasi fade-in
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    // Timer untuk pindah ke halaman utama setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // --- PERUBAHAN NAVIGASI MENGGUNAKAN GO_ROUTER ---
        // Mengganti Navigator.pushReplacement dengan context.go
        // Ini akan membersihkan tumpukan navigasi dan pindah ke rute /home
        context.go(AppRoutes.home);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/onic_logo.png', width: 120),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to',
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  const Text(
                    'Aplikasi Manajemen ONIC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Teks pembuat di bagian bawah layar
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'Dibuat oleh ISMAIL ALI MUKHAROM',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white38),
              ),
            ),
          ),
        ],
      ),
    );
  }
}