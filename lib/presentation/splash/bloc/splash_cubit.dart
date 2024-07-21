import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repo/auth_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepo _authRepo;

  SplashCubit(this._authRepo) : super(SplashInitial());

  Future<void> checkLogin() async {
    emit(SplashLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final hasToken = await _authRepo.readAccessToken();
      hasToken ? emit(LoggedIn()) : emit(LoggedOut());
    } catch (e) {
      emit(SplashFailed(error: e.toString()));
    }
  }
}
