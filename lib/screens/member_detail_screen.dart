import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 1. Import library Bloc
import 'package:shared_preferences/shared_preferences.dart';
import '../models/member_oop.dart';
import '../cubit/team_cubit.dart'; // 2. Import Cubit
import '../cubit/team_state.dart'; // 3. Import State

class MemberDetailScreen extends StatefulWidget {
  final Player member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  // Logika untuk rating pengguna (State Lokal, tidak perlu Cubit)
  double _userRating = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserRating();
  }

  Future<void> _loadUserRating() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'rating_${widget.member.ign}';
    setState(() {
      _userRating = prefs.getDouble(key) ?? widget.member.rating;
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
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // Layout untuk layar lebar (PC/Browser)
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            widget.member.imagePath,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: _buildDetailsContent(context),
          ),
        ),
      ],
    );
  }

  // Layout untuk layar sempit (HP)
  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            widget.member.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildDetailsContent(context),
          ),
        ],
      ),
    );
  }

  // Tombol "Beli" di bagian bawah (Diperbarui dengan Cubit)
  Widget _buildBottomNavBar(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black,
      // 4. Mengganti Consumer dengan BlocBuilder
      child: BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          // 5. Logika 'isBought' sekarang membaca dari 'state'
          bool isBought = state.myTeam.contains(widget.member);

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isBought ? Colors.grey : Colors.yellow,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: isBought
                ? null // Tombol mati jika sudah dibeli
                : () {
              // 6. Memanggil fungsi Cubit menggunakan context.read()
              context.read<TeamCubit>().buyPlayer(widget.member);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${widget.member.name} berhasil ditambahkan ke Tim Saya!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(
              isBought ? 'SUDAH DIBELI' : 'BELI SEKARANG (${formatCurrency.format(widget.member.price)})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  // Konten detail biodata (tidak ada perubahan di sini)
  Widget _buildDetailsContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.member.ign, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow)),
        Text(widget.member.getDisplayRole(), style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white70)),
        const SizedBox(height: 20),

        const Text('Rating Komunitas:', style: TextStyle(color: Colors.white70)),
        RatingBarIndicator(
          rating: widget.member.rating,
          itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 20.0,
        ),
        const SizedBox(height: 20),

        _buildDetailRow('Nama Lengkap', widget.member.fullName),
        _buildDetailRow('Kewarganegaraan', widget.member.nationality),
        _buildDetailRow('Hero Andalan', widget.member.signatureHeroes.join(', ')),
        const SizedBox(height: 20),
        const Text('Gelar Juara Bersama ONIC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow)),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.member.achievements.map((achievement) => _buildAchievementItem(achievement)).toList(),
        ),

        const SizedBox(height: 20),
        const Divider(color: Colors.yellow),
        const SizedBox(height: 10),
        const Text(
          'Berikan Rating Anda',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        const SizedBox(height: 10),
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

  Widget _buildAchievementItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 16),
          const SizedBox(width: 8),
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