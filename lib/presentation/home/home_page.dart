import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/domain/repo/repo.dart';
import 'package:lanars_demo/presentation/home/bloc/home_cubit.dart';
import 'package:lanars_demo/presentation/home/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(RepositoryProvider.of<Repo>(context))..getData(),
      child: HomeScreen(),
    );
  }
}
