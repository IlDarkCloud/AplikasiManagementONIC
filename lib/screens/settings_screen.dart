import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/team_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showClearTeamConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Konfirmasi', style: TextStyle(color: Colors.yellow)),
        content: const Text(
          'Anda yakin ingin menjual semua pemain di tim Anda?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {
              Provider.of<TeamProvider>(context, listen: false).clearTeam();
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Semua pemain telah dijual.'),
                  backgroundColor: Colors.blueGrey,
                ),
              );
            },
            child: const Text('Ya, Jual Semua', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
            title: const Text('Hapus Tim Saya', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Jual semua pemain yang sudah Anda beli.', style: TextStyle(color: Colors.white70)),
            onTap: () => _showClearTeamConfirmation(context),
          ),
        ],
      ),
    );
  }
}
