import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/presentation/splash/bloc/splash_cubit.dart';
import 'package:lanars_demo/presentation/splash/splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(RepositoryProvider.of<AuthRepo>(context))..checkLogin(),
      child: const SplashScreen(),
    );
  }
}
