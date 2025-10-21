import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/onic_data.dart';
import 'member_detail_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat format untuk mata uang Rupiah
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bursa Transfer'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: playersForSale.length,
        itemBuilder: (context, index) {
          final player = playersForSale[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: CircleAvatar(
                backgroundImage: AssetImage(player.imagePath),
                radius: 30,
              ),
              title: Text(player.name, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(player.getDisplayRole(), style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 4),
                  // Menampilkan harga yang sudah diformat
                  Text(
                    formatCurrency.format(player.price),
                    style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.yellow),
              onTap: () {
                // Pindah ke halaman detail pemain saat di-klik
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
      ),
    );
  }
}

