// lib/auth_service.dart
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AuthService {
  final Client client = Client();
  late final Account account;

  AuthService() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Ganti dengan endpoint Appwrite
        .setProject('671dd90a0001b16a70f3'); // Ganti dengan project ID
    account = Account(client);
  }

  Future<void> register(String email, String password) async {
    try {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Registrasi gagal: $e');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await account.createEmailSession(email: email, password: password);
    } catch (e) {
      throw Exception('Login gagal: $e');
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw Exception('Logout gagal: $e');
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return await account.get();
    } catch (e) {
      return null;
    }
  }
}

extension on Account {
  createEmailSession({required String email, required String password}) {}
}
