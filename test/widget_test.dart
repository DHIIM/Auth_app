import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; // Pastikan jalur ini sesuai dengan struktur proyek Anda

void main() {
  testWidgets('Menampilkan tombol Login dan Register pada WelcomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa tombol "Login" ada
    expect(find.text('Login'), findsOneWidget);

    // Verifikasi bahwa tombol "Register" ada
    expect(find.text('Register'), findsOneWidget);

    // Coba interaksi: ketuk tombol Login dan Register untuk memverifikasi bahwa layar berpindah
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Setelah tap "Login", verifikasi elemen layar login muncul
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    // Kembali ke WelcomeScreen untuk mengetes tombol Register
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    // Setelah tap "Register", verifikasi elemen layar register muncul
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);
  });
}

