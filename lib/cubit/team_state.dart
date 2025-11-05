import 'package:equatable/equatable.dart';
import '../models/member_oop.dart';

// Model sederhana untuk mencatat transaksi
enum TransactionType { bought, sold }

class Transaction extends Equatable {
  final Player player;
  final TransactionType type;
  final DateTime timestamp;

  const Transaction({
    required this.player,
    required this.type,
    required this.timestamp,
  });

  // Helper untuk mengubah enum menjadi teks
  String get typeAsString => type == TransactionType.bought ? 'Beli' : 'Jual';

  @override
  List<Object> get props => [player, type, timestamp];
}

// State utama yang akan dikelola Cubit
class TeamState extends Equatable {
  final List<Player> myTeam;
  final List<Transaction> history;

  const TeamState({
    this.myTeam = const [], // Nilai default: list kosong
    this.history = const [], // Nilai default: list kosong
  });

  // Fungsi 'copyWith' sangat penting untuk immutable state.
  // Ini membuat salinan state lama dengan data baru.
  TeamState copyWith({
    List<Player>? myTeam,
    List<Transaction>? history,
  }) {
    return TeamState(
      myTeam: myTeam ?? this.myTeam,
      history: history ?? this.history,
    );
  }

  // 'props' dari Equatable membantu membandingkan state lama dan baru
  // Jika props sama, UI tidak akan di-rebuild.
  @override
  List<Object> get props => [myTeam, history];
}