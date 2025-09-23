import 'package:flutter/material.dart';
import '../models/member_oop.dart';
import 'member_detail_screen.dart';

class MemberListScreen extends StatelessWidget {
  final String title;
  final List<TeamMember> members; // Menerima daftar dengan tipe TeamMember

  const MemberListScreen({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        // Menghitung jumlah item dari daftar 'members'
        itemCount: members.length,
        // Membangun setiap item dalam daftar
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              // Menampilkan foto anggota di sebelah kiri
              leading: CircleAvatar(
                backgroundImage: AssetImage(member.imagePath),
                radius: 30,
              ),
              // Menampilkan nama panggilan (IGN)
              title: Text(member.name, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
              // Menampilkan role atau jabatan menggunakan Polymorphism
              // Metode ini akan memberikan hasil yang berbeda untuk Player dan Coach
              subtitle: Text(
                  member.getDisplayRole(),
                  style: const TextStyle(color: Colors.white70)
              ),
              // Aksi saat item di-klik
              onTap: () {
                // Pindah ke halaman detail dengan membawa data 'member' yang dipilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailScreen(member: member),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

