import 'package:flutter/material.dart';
import '../models/member_oop.dart';

// Model sederhana untuk mencatat transaksi
enum TransactionType { bought, sold }

class Transaction {
  final Player player;
  final TransactionType type;
  final DateTime timestamp;

  Transaction({required this.player, required this.type, required this.timestamp});

  // Helper untuk mengubah enum menjadi teks
  String get typeAsString => type == TransactionType.bought ? 'Beli' : 'Jual';
}


class TeamProvider with ChangeNotifier {
  final List<Player> _myTeam = [];
  final List<Transaction> _history = []; // Daftar baru untuk menyimpan riwayat

  List<Player> get myTeam => _myTeam;
  List<Transaction> get history => List.unmodifiable(_history.reversed); // Getter untuk riwayat (dibalik agar terbaru di atas)

  void buyPlayer(Player player) {
    if (!_myTeam.contains(player)) {
      _myTeam.add(player);
      // Mencatat transaksi pembelian
      _history.add(Transaction(player: player, type: TransactionType.bought, timestamp: DateTime.now()));
      notifyListeners();
    }
  }

  void sellPlayer(Player player) {
    if (_myTeam.contains(player)) {
      _myTeam.remove(player);
      // Mencatat transaksi penjualan
      _history.add(Transaction(player: player, type: TransactionType.sold, timestamp: DateTime.now()));
      notifyListeners();
    }
  }

  // Fungsi baru untuk menghapus semua pemain dari tim
  void clearTeam() {
    _myTeam.clear();
    // Kita bisa juga menambahkan log ke riwayat jika perlu
    notifyListeners();
  }

  bool isPlayerBought(Player player) {
    return _myTeam.contains(player);
  }
}

