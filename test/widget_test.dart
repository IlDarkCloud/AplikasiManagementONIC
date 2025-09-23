// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Hanya satu import yang benar yang diperlukan.
import 'package:onic_esports_app/main.dart';

void main() {
  testWidgets('Splash screen shows ONIC logo and loading indicator', (WidgetTester tester) async {
    // 1. Build aplikasi kita.
    await tester.pumpWidget(const OnicEsportsApp());

    // 2. Verifikasi bahwa logo ONIC (widget Image) muncul di splash screen.
    expect(find.byType(Image), findsOneWidget);

    // 3. Verifikasi bahwa CircularProgressIndicator juga muncul.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
