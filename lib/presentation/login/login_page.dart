import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/presentation/login/bloc/login_cubit.dart';
import 'package:lanars_demo/presentation/login/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(RepositoryProvider.of<AuthRepo>(context)),
      child: const LoginScreen(),
    );
  }
}
