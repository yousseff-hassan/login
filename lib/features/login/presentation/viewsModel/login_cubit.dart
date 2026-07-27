import 'package:fad/core/errors/failure.dart';
import 'package:fad/features/login/data/repository/login_repo.dart';
import 'package:fad/features/login/presentation/viewsModel/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty) {
      emit(LoginFailure(errorMessage: 'Please enter your email'));
      return;
    }
    if (password.isEmpty) {
      emit(LoginFailure(errorMessage: 'Please enter your password'));
      return;
    }

    emit(LoginLoading());

    try {
      final user = await loginRepo.login(email: email, password: password);
      emit(LoginSuccess(user: user));
    } catch (e) {
      if (e is Failure) {
        emit(LoginFailure(errorMessage: e.errorMessage));
      } else {
        emit(LoginFailure(errorMessage: 'An unexpected error occurred. Please try again.'));
      }
    }
  }
}
