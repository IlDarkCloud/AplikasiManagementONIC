import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // <-- IMPORT YANG HILANG
import 'package:shared_preferences/shared_preferences.dart';
import '../models/member_oop.dart';

class MemberDetailScreen extends StatefulWidget {
  final TeamMember member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  double _userRating = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.member is Player) {
      _loadUserRating();
    }
  }

  Future<void> _loadUserRating() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'rating_${widget.member.ign}';
    setState(() {
      _userRating = prefs.getDouble(key) ?? (widget.member as Player).rating;
    });
  }

  Future<void> _saveUserRating(double rating) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'rating_${widget.member.ign}';
    await prefs.setDouble(key, rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member.name),
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
          child: Image.asset(widget.member.imagePath, fit: BoxFit.cover, height: double.infinity),
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
          Image.asset(widget.member.imagePath, fit: BoxFit.cover, width: double.infinity, height: 400),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildDetailsContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsContent() {
    final member = widget.member;

    String formatDate(DateTime date) {
      return DateFormat('d MMMM yyyy', 'id_ID').format(date);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(member.ign, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow)),
        Text(member.getDisplayRole(), style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white70)),
        const SizedBox(height: 20),

        if (member is Player) ...[
          const Text('Rating Komunitas:', style: TextStyle(color: Colors.white70)),
          // Memanggil RatingBarIndicator dengan benar
          RatingBarIndicator(
            rating: member.rating, // Memanggil properti rating
            itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
            itemCount: 5,
            itemSize: 20.0,
          ),
          const SizedBox(height: 20),
        ],

        _buildDetailRow('Nama Lengkap', member.fullName),
        _buildDetailRow('Kewarganegaraan', member.nationality),

        if (member is Player)
          _buildDetailRow('Hero Andalan', member.signatureHeroes.join(', ')),

        if (member is Coach)
          _buildDetailRow('Bergabung', formatDate((member as Coach).joinDate)),

        const SizedBox(height: 20),
        const Text('Fakta Menarik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow)),
        const SizedBox(height: 5),
        Text(member.funFact, style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.4)),
        const SizedBox(height: 20),
        const Text('Gelar Juara Bersama ONIC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow)),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: member.achievements.map((achievement) => _buildAchievementItem(achievement)).toList(),
        ),

        if (member is Player) ...[
          const SizedBox(height: 20),
          const Divider(color: Colors.yellow),
          const SizedBox(height: 10),
          const Text('Berikan Rating Anda', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow)),
          const SizedBox(height: 10),
          // Memanggil RatingBar.builder dengan benar
          RatingBar.builder(
            initialRating: _userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              setState(() {
                _userRating = rating;
              });
              _saveUserRating(rating);
            },
          ),
        ]
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
            child: Text('$title:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(title, style: const TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

