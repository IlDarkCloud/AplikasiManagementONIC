import 'package:flutter/material.dart';
import '../models/member_oop.dart';
import 'member_detail_screen.dart';

class MemberListScreen extends StatelessWidget {
  final String title;
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
          // Menggunakan Card standar Flutter
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              // Menggunakan CircleAvatar standar Flutter
              leading: CircleAvatar(
                backgroundImage: AssetImage(member.imagePath),
                radius: 30,
              ),
              title: Text(member.name, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
              subtitle: Text(member.getDisplayRole(), style: const TextStyle(color: Colors.white70)),
              onTap: () {
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

