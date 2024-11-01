// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../auth_service.dart';

class HomeScreen extends StatelessWidget {
  final _authService = AuthService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
