import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repo/repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repo _repo;

  HomeCubit(this._repo) : super(HomeInitial());

  Future<void> getData() async {
    try {
      emit(HomeLoading());
      final user = await _repo.getUser();
      emit(HomeSucceed());
    } catch (e) {
      emit(HomeFailed());
    }
  }

  Future<void> logOut() async {
    try {
      emit(HomeLoading());
      await _repo.logOut();
      emit(UserLogOut());
    } catch (e) {
      emit(HomeFailed());
    }
  }
}
