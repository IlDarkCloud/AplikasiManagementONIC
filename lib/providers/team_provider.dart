import 'package:flutter/material.dart';

// 1. Definisikan class provider Anda
// 'with ChangeNotifier' memberitahu Flutter untuk "mendengarkan" perubahan di class ini.
class TeamProvider with ChangeNotifier {

  // --- CONTOH DATA ---
  // Anda bisa menyimpan data apa pun di sini.
  // Misalnya, daftar nama tim.
  List<String> _teams = [
    'Team A',
    'Team B',
    'Team C',
  ];

  // --- CONTOH GETTER ---
  // Ini adalah cara agar widget Anda bisa "membaca" data.
  List<String> get teams => _teams;

  // --- CONTOH METHOD UNTUK MENGUBAH DATA ---
  // Ini adalah cara untuk "mengubah" data dari UI.
  void addTeam(String teamName) {
    _teams.add(teamName);

    // 2. Panggil notifyListeners()
    // Ini adalah bagian terpentING!
    // Ini memberitahu semua widget yang mendengarkan bahwa data telah berubah
    // dan mereka harus membangun ulang (refresh) tampilan.
    notifyListeners();
  }

  void removeTeam(String teamName) {
    _teams.remove(teamName);
    notifyListeners();
  }

// Anda bisa menambahkan logika lain di sini (misalnya, loading data dari API)
}