import 'package:fad/core/errors/failure.dart';
import 'package:fad/features/login/data/model/login_model.dart';
import 'package:fad/features/login/data/repository/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final List<Map<String, String>> _fakeUsers = [
    {
      'email': 'user1@example.com',
      'password': 'password123',
      'name': 'User One',
    },
    {
      'email': 'nour@fad.com',
      'password': 'securepassword',
      'name': 'Nour',
    },
    {
      'email': 'admin@fad.com',
      'password': 'adminpassword',
      'name': 'Admin User',
    },
  ];

  @override
  Future<LoginModel> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _fakeUsers.firstWhere(
        (element) => element['email'] == email && element['password'] == password,
      );

      return LoginModel(
        email: user['email']!,
        password: user['password']!,
        token: 'fake-jwt-token-12345',
        name: user['name']!,
      );
    } catch (_) {
      throw const ServerFailure('Invalid email or password');
    }
  }
}
