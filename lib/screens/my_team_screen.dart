import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import library Bloc
import 'package:go_router/go_router.dart'; // Import go_router
import '../cubit/team_cubit.dart'; // Import Cubit
import '../cubit/team_state.dart'; // Import State
import '../models/member_oop.dart';
import '../config/app_router.dart'; // Import nama rute

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  // Fungsi untuk menampilkan dialog konfirmasi sebelum menjual
  void _showSellConfirmationDialog(BuildContext context, Player player) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text('Konfirmasi Penjualan', style: TextStyle(color: Colors.yellow)),
          content: Text('Anda yakin ingin menjual ${player.name}?', style: const TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal', style: TextStyle(color: Colors.white70)),
              onPressed: () {
                Navigator.of(ctx).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text('Jual', style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                // 1. Memanggil fungsi Cubit menggunakan context.read()
                context.read<TeamCubit>().sellPlayer(player);
                Navigator.of(ctx).pop(); // Tutup dialog

                // Tampilkan notifikasi bahwa pemain berhasil dijual
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${player.name} berhasil dijual!'),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tim Saya'),
        backgroundColor: Colors.black,
      ),
      // 2. Mengganti Consumer dengan BlocBuilder
      body: BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          // 3. Membaca daftar pemain dari 'state.myTeam'
          if (state.myTeam.isEmpty) {
            return const Center(
              child: Text(
                'Anda belum membeli pemain.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          }

          // Jika ada pemain, tampilkan dalam ListView
          return ListView.builder(
            itemCount: state.myTeam.length,
            itemBuilder: (context, index) {
              final player = state.myTeam[index];
              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(player.imagePath),
                    radius: 30,
                  ),
                  title: Text(player.name, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                  subtitle: Text(player.getDisplayRole(), style: const TextStyle(color: Colors.white70)),
                  // Tombol Jual di sebelah kanan
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    tooltip: 'Jual Pemain',
                    onPressed: () {
                      _showSellConfirmationDialog(context, player);
                    },
                  ),
                  // Aksi saat item di-klik (untuk melihat detail)
                  onTap: () {
                    // 4. Navigasi menggunakan go_router
                    context.push(AppRoutes.playerDetail, extra: player);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}