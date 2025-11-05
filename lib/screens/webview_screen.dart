import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;
  const WebViewScreen({super.key, required this.title, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            // Sembunyikan loading setelah halaman selesai dimuat
            setState(() {
              _isLoading = false;
            });
          },
          onPageStarted: (String url) {
            // Tampilkan loading saat halaman mulai dimuat
            setState(() {
              _isLoading = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Memuat URL yang dikirim
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          // Tampilkan indikator loading di tengah saat halaman sedang dimuat
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Colors.yellow),
            ),
        ],
      ),
    );
  }
}