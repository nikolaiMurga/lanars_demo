part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeSucceed extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeFailed extends HomeState {
  @override
  List<Object> get props => [];
}

final class UserLogOut extends HomeState {
  @override
  List<Object> get props => [];
}
