import 'package:flutter/material.dart';
import '../models/member_oop.dart';
import 'member_detail_screen.dart';

class MemberListScreen extends StatelessWidget {
  final String title;
  // Diperbaiki: Menerima tipe data yang lebih umum, yaitu List<TeamMember>
  final List<TeamMember> members;

  const MemberListScreen({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(member.imagePath),
                radius: 30,
              ),
              title: Text(member.name, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
              subtitle: Text(member.getDisplayRole(), style: const TextStyle(color: Colors.white70)),
              onTap: () {
                // Saat di-klik, pindah ke halaman detail
                // Kita perlu memeriksa apakah member adalah Player sebelum pindah ke detail marketplace
                if (member is Player) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberDetailScreen(member: member),
                    ),
                  );
                } else {
                  // Jika yang di-klik adalah Coach, kita bisa tampilkan notifikasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hanya pemain yang bisa dilihat di bursa transfer.'),
                      backgroundColor: Colors.blueGrey,
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

