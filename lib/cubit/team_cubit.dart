import 'package:bloc/bloc.dart';
import 'package:onic_esports_app/models/member_oop.dart';
import 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  // Inisialisasi state awal (kosong)
  TeamCubit() : super(const TeamState());

  // Fungsi untuk membeli pemain
  void buyPlayer(Player player) {
    // Cek jika pemain sudah dibeli
    if (state.myTeam.contains(player)) return;

    // Buat list baru (immutable)
    final newTeam = List<Player>.from(state.myTeam)..add(player);

    // Buat riwayat baru (immutable)
    final newHistory = List<Transaction>.from(state.history)
      ..add(Transaction(
        player: player,
        type: TransactionType.bought,
        timestamp: DateTime.now(),
      ));

    // 'emit' adalah pengganti 'notifyListeners()'
    // Kita mengirimkan state baru yang disalin dari state lama
    emit(state.copyWith(myTeam: newTeam, history: newHistory));
  }

  // Fungsi untuk menjual pemain
  void sellPlayer(Player player) {
    if (!state.myTeam.contains(player)) return;

    final newTeam = List<Player>.from(state.myTeam)..remove(player);

    final newHistory = List<Transaction>.from(state.history)
      ..add(Transaction(
        player: player,
        type: TransactionType.sold,
        timestamp: DateTime.now(),
      ));

    emit(state.copyWith(myTeam: newTeam, history: newHistory));
  }

  // Fungsi untuk membersihkan tim
  void clearTeam() {
    // Hanya mengosongkan tim, riwayat tetap ada
    emit(state.copyWith(myTeam: []));
  }
}