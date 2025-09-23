import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'member_list_screen.dart';
import '../data/onic_data.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/onic_logo.png', height: 100),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Sejarah Sang Raja Langit'),
            const SizedBox(height: 10),
            _buildParagraph(
                'ONIC Esports didirikan pada 26 Juli 2018. Nama mereka melesat di kancah Mobile Legends pada MPL ID Season 3 dengan roster legendaris "Lima Kage" (Udil, Psychoo, Drian, Sasa, Antimage). Mereka mendominasi musim tersebut tanpa sekalipun kalah dan berlanjut menjuarai MSC 2019, mengukuhkan julukan mereka sebagai "Raja Langit".'
            ),
            const SizedBox(height: 10),
            _buildParagraph(
                'Setelah era Kage, ONIC melalui masa transisi sebelum akhirnya membangun dinasti baru. Dengan masuknya talenta-talenta luar biasa seperti Kairi, Sanz, dan Kiboy, ONIC kembali mendominasi MPL Indonesia dengan memenangkan beberapa musim secara beruntun dan kembali mengangkat piala MSC pada tahun 2023.'
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('Gelar Juara Divisi Mobile Legends'),
            const SizedBox(height: 10),
            _buildAchievementItem('MPL Indonesia Season 3 (2019)'),
            _buildAchievementItem('Piala Presiden Esports (2019)'),
            _buildAchievementItem('MSC - MLBB Southeast Asia Cup (2019)'),
            _buildAchievementItem('MPL Indonesia Season 8 (2021)'),
            _buildAchievementItem('ONE Esports MPL Invitational (2021)'),
            _buildAchievementItem('MPL Indonesia Season 10 (2022)'),
            _buildAchievementItem('MPL Indonesia Season 11 (2023)'),
            _buildAchievementItem('MSC - MLBB Southeast Asia Cup (2023)'),
            _buildAchievementItem('Snapdragon Pro Series S3 SEA (2023)'),
            _buildAchievementItem('MPL Indonesia Season 12 (2023)'),
            _buildAchievementItem('Runner-Up M5 World Championship (2023)'),
            _buildAchievementItem('MPL Indonesia Season 15 (2025)'),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
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
              child: const Text('Lihat Biodata Tim', style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bantuan untuk judul seksi
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.yellow),
    );
  }

  // Widget bantuan untuk paragraf
  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
      textAlign: TextAlign.justify,
    );
  }

  // Widget bantuan untuk item pencapaian
  Widget _buildAchievementItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

