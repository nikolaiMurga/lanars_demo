import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;

  LoginCubit(this._authRepo) : super(LoginInitial());

  bool isActiveUI = true;

  Future<void> login() async {
    isActiveUI = false;
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 5));
    isActiveUI = true;
    emit(LoginInitial());
  }
}
