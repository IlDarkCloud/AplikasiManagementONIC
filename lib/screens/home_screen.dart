import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'member_list_screen.dart';
import '../data/onic_data.dart';
import 'device_info_screen.dart';
import 'webview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ONIC Esports'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.yellow),
            tooltip: 'Logout',
            onPressed: () {
              // Navigasi kembali ke splash screen saat logout
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat semua tombol melebar
          children: [
            Center(
              child: Image.asset('assets/images/onic_logo.png', height: 100),
            ),
            const SizedBox(height: 20),

            // Menggunakan ElevatedButton standar sebagai pengganti GFButton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Warna latar tombol
                foregroundColor: Colors.black, // Warna teks tombol
                minimumSize: const Size(double.infinity, 50), // Ukuran tombol
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberListScreen(
                      title: 'Anggota Tim',
                      members: onicTeamMembers,
                    ),
                  ),
                );
              },
              child: const Text("Lihat Biodata Tim", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),

            // Menggunakan OutlinedButton standar
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.yellow), // Warna border
                foregroundColor: Colors.yellow, // Warna teks
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
                        title: "Website Resmi ONIC",
                        url: "https://www.onic-esports.com/",
                      )),
                );
              },
              child: const Text("Kunjungi Website Resmi", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),

            // Menggunakan TextButton standar
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.yellow, // Warna teks
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeviceInfoScreen(),
                  ),
                );
              },
              child: const Text("Info Perangkat", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

