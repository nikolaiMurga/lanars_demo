import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/data/network/requests/login_request.dart';

import '../../../domain/repo/repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repo _repo;

  LoginCubit(this._repo) : super(LoginInitial());

  bool isActiveUI = true;

  Future<void> login({required String email, required String password}) async {
    isActiveUI = false;
    try {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 1));
      final request = LoginRequest(email: email, password: password);
      final user = await _repo.login(request: request);
      print(user.name);
      print(user.email);
      print(user.avatar);
      isActiveUI = true;
      emit(LoginSucceed());
    } catch (e){
      emit(LoginFailed(error: e.toString()));
    }
  }
}
