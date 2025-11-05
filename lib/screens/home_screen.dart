import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import '../config/app_router.dart'; // Import file konfigurasi rute

// Import halaman-halaman lain tidak lagi diperlukan di sini
// karena navigasi ditangani oleh router.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fungsi untuk menampilkan notifikasi fitur belum tersedia
  void _showFeatureNotAvailable(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur ini belum tersedia'),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
        title: Image.asset('assets/images/onic_logo.png', height: 40),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.yellow),
            tooltip: 'Logout',
            onPressed: () {
              // --- PERUBAHAN NAVIGASI GO_ROUTER ---
              // Mengganti tumpukan navigasi kembali ke splash screen
              context.go(AppRoutes.splash);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Selamat Datang, Manajer!',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const Text(
              'ONIC Esports Marketplace',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Fitur Pencarian
            TextField(
              readOnly: true,
              onTap: () {
                // --- PERUBAHAN NAVIGASI GO_ROUTER ---
                // Mendorong (push) halaman pencarian di atas halaman ini
                context.push(AppRoutes.search);
              },
              decoration: InputDecoration(
                hintText: 'Cari pemain...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Grid Menu Navigasi
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMenuCard(
                  context: context,
                  icon: Icons.storefront,
                  title: 'Bursa Transfer',
                  onTap: () {
                    // --- PERUBAHAN NAVIGASI GO_ROUTER ---
                    context.push(AppRoutes.marketplace);
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.shield,
                  title: 'Tim Saya',
                  onTap: () {
                    // --- PERUBAHAN NAVIGASI GO_ROUTER ---
                    context.push(AppRoutes.myTeam);
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.history,
                  title: 'Riwayat',
                  onTap: () {
                    // --- PERUBAHAN NAVIGASI GO_ROUTER ---
                    context.push(AppRoutes.history);
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.settings,
                  title: 'Pengaturan',
                  onTap: () {
                    // --- PERUBAHAN NAVIGASI GO_ROUTER ---
                    context.push(AppRoutes.settings);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget bantuan untuk membuat kartu menu
  Widget _buildMenuCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.yellow),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}