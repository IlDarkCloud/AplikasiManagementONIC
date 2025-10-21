import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/onic_data.dart';
import '../models/member_oop.dart';
import 'member_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // --- PERUBAHAN 1: Buat daftar hasil pencarian kosong pada awalnya ---
  List<Player> _searchResults = [];
  // Variabel untuk melacak apakah pengguna sudah mengetik sesuatu
  bool _hasSearched = false;

  // Fungsi untuk memfilter pemain berdasarkan kata kunci
  void _runFilter(String enteredKeyword) {
    List<Player> results = [];
    if (enteredKeyword.isEmpty) {
      // Jika input kosong, kosongkan juga hasilnya
      results = [];
    } else {
      results = playersForSale
          .where((player) =>
      player.name.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
          player.role.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchResults = results;
      _hasSearched = true; // Tandai bahwa pencarian sudah dilakukan
    });
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Pemain'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              autofocus: true, // Keyboard langsung muncul
              decoration: InputDecoration(
                labelText: 'Ketik nama atau role pemain...',
                labelStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: const Icon(Icons.search, color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              // --- PERUBAHAN 2: Logika tampilan hasil pencarian ---
              child: _buildSearchResults(formatCurrency),
            ),
          ],
        ),
      ),
    );
  }

  // Widget baru untuk menampilkan hasil pencarian dengan logika yang benar
  Widget _buildSearchResults(NumberFormat formatCurrency) {
    // Jika hasil pencarian tidak kosong
    if (_searchResults.isNotEmpty) {
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final player = _searchResults[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(player.imagePath)),
              title: Text(player.name, style: const TextStyle(color: Colors.yellow)),
              subtitle: Text(formatCurrency.format(player.price), style: const TextStyle(color: Colors.greenAccent)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailScreen(member: player),
                  ),
                );
              },
            ),
          );
        },
      );
    }
    // Jika pengguna sudah mencari tapi tidak ada hasil
    else if (_hasSearched) {
      return const Center(
        child: Text('Pemain tidak ditemukan.', style: TextStyle(color: Colors.white70)),
      );
    }
    // Jika pengguna belum melakukan apa-apa (tampilan awal)
    else {
      return const Center(
        child: Text('Mulai ketik untuk mencari pemain.', style: TextStyle(color: Colors.white70)),
      );
    }
  }
}

