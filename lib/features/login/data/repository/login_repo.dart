import 'package:fad/features/login/data/model/login_model.dart';

abstract class LoginRepo {
  Future<LoginModel> login({required String email, required String password});
}
