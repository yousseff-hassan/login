import 'package:fad/features/login/data/model/login_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginModel user;
  LoginSuccess({required this.user});
}

class LoginFailure extends LoginStates {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
