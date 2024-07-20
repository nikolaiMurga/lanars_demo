part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}

final class LoggedIn extends SplashState {
  @override
  List<Object> get props => [];
}

final class LoggedOut extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashFailed extends SplashState {
  final String error;

  const SplashFailed({required this.error});

  @override
  List<Object> get props => [error];
}
