import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 1. Import library Bloc
import '../cubit/team_cubit.dart'; // 2. Import Cubit
import '../cubit/team_state.dart'; // 3. Import State

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Colors.black,
      ),
      // 4. Mengganti Consumer dengan BlocBuilder
      body: BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          // 5. Membaca daftar riwayat dari 'state'
          // Kita .reversed.toList() di sini agar yang terbaru tampil di atas
          final historyList = state.history.reversed.toList();

          if (historyList.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada transaksi.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final transaction = historyList[index];
              final isBought = transaction.type == TransactionType.bought;
              final formatTime = DateFormat('d MMM yyyy, HH:mm', 'id_ID');

              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(transaction.player.imagePath),
                  ),
                  title: Text(
                    // 'typeAsString' berasal dari model 'Transaction' di team_state.dart
                    '${transaction.typeAsString}: ${transaction.player.name}',
                    style: TextStyle(
                      color: isBought ? Colors.greenAccent : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    formatTime.format(transaction.timestamp),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}