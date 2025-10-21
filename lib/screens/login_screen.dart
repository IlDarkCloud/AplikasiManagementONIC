import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  // Memuat email yang tersimpan dari SharedPreferences
  void _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    if (email != null) {
      setState(() {
        _emailController.text = email;
        _rememberMe = true;
      });
    }
  }

  // Navigasi ke halaman selamat datang
  void _navigateToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  // Fungsi untuk menangani login via email
  void _handleEmailLogin() async {
    const String correctEmail = 'admin@onic.com';
    const String correctPassword = '123456';

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final prefs = await SharedPreferences.getInstance();

    if (email == correctEmail && password == correctPassword) {
      if (_rememberMe) {
        await prefs.setString('email', email);
      } else {
        await prefs.remove('email');
      }
      _navigateToWelcome();
    } else {
      _showErrorSnackbar('Email atau Password salah, coba lagi!');
    }
  }

  // Fungsi untuk menampilkan notifikasi error (merah)
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red[800],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  // --- FUNGSI BARU UNTUK NOTIFIKASI FITUR ---
  // Fungsi ini akan menampilkan notifikasi informatif (biru keabu-abuan)
  void _showFeatureNotAvailableSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Fitur ini belum tersedia'),
        backgroundColor: Colors.blueGrey,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/onic_bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/onic_logo.png', width: 100, height: 100),
                const SizedBox(height: 20),
                const Text(
                  "Selamat Datang, SONIC!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Masuk untuk melanjutkan",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _buildInputDecoration('Email', Icons.email_outlined),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _buildInputDecoration('Password', Icons.lock_outline),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) => setState(() => _rememberMe = value!),
                            checkColor: Colors.black,
                            activeColor: Colors.yellow,
                          ),
                          const Text("Ingat Saya", style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      TextButton(
                        onPressed: _showFeatureNotAvailableSnackbar, // Diubah ke notifikasi
                        child: const Text(
                          "Lupa Password?",
                          style: TextStyle(color: Colors.yellow, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _handleEmailLogin,
                  child: const Text('MASUK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                _buildDivider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // --- PERUBAHAN UTAMA ADA DI SINI ---
                    // Tombol Google sekarang memanggil notifikasi, bukan login
                    _buildSocialButton(FontAwesomeIcons.google, _showFeatureNotAvailableSnackbar),
                    const SizedBox(width: 20),
                    // Tombol Apple sekarang memanggil notifikasi, bukan login
                    _buildSocialButton(FontAwesomeIcons.apple, _showFeatureNotAvailableSnackbar),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: _showFeatureNotAvailableSnackbar, // Diubah ke notifikasi
                      child: const Text("Daftar di sini", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget bantuan untuk dekorasi TextField
  InputDecoration _buildInputDecoration(String label, IconData prefixIcon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon, color: Colors.yellow[700]),
      labelStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.black.withOpacity(0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Widget bantuan untuk tombol sosial media
  Widget _buildSocialButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(18),
        backgroundColor: Colors.white.withOpacity(0.1),
        foregroundColor: Colors.white,
      ),
      child: FaIcon(icon, size: 24),
    );
  }

  // Widget bantuan untuk pemisah "atau"
  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.white30)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("atau masuk dengan", style: TextStyle(color: Colors.white70)),
        ),
        Expanded(child: Divider(color: Colors.white30)),
      ],
    );
  }
}

