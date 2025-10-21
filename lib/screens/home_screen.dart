import 'package:flutter/material.dart';
import 'marketplace_screen.dart';
import 'my_team_screen.dart';
import 'splash_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/onic_logo.png', height: 40),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.yellow),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      // MENGEMBALIKAN SingleChildScrollView
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MarketplaceScreen()));
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.shield,
                  title: 'Tim Saya',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTeamScreen()));
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.history,
                  title: 'Riwayat',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()));
                  },
                ),
                _buildMenuCard(
                  context: context,
                  icon: Icons.settings,
                  title: 'Pengaturan',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
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

