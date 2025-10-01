import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import ini sekarang akan berhasil
import '../models/member_oop.dart';

class MemberDetailScreen extends StatelessWidget {
  final TeamMember member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(member.imagePath, fit: BoxFit.cover, height: double.infinity),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: _buildDetailsContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(member.imagePath, fit: BoxFit.cover, width: double.infinity, height: 400),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildDetailsContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsContent() {
    // Fungsi untuk memformat tanggal menggunakan 'intl'
    String formatDate(DateTime date) {
      return DateFormat('d MMMM yyyy', 'id_ID').format(date);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          member.ign,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        Text(
          member.getDisplayRole(),
          style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white70),
        ),
        const SizedBox(height: 20),
        _buildDetailRow('Nama Lengkap', member.fullName),
        _buildDetailRow('Kewarganegaraan', member.nationality),

        if (member is Player)
          _buildDetailRow('Hero Andalan', (member as Player).signatureHeroes.join(', ')),

        if (member is Coach)
          _buildDetailRow('Bergabung', formatDate((member as Coach).joinDate)),

        const SizedBox(height: 20),
        const Text(
          'Fakta Menarik',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        const SizedBox(height: 5),
        Text(
          member.funFact,
          style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
        ),
        const SizedBox(height: 20),
        const Text(
          'Gelar Juara Bersama ONIC',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: member.achievements.map((achievement) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      achievement,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              '$title:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

