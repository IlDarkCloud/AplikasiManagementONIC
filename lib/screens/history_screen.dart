import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/team_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Colors.black,
      ),
      body: Consumer<TeamProvider>(
        builder: (context, team, child) {
          if (team.history.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada transaksi.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: team.history.length,
            itemBuilder: (context, index) {
              final transaction = team.history[index];
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
