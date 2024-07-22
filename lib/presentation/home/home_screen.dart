import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/presentation/common/helpers/app_navigator.dart';

import 'bloc/home_cubit.dart';
import 'widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _homeKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UserLogOut) AppNavigator().goToLogin();
      },
      child: Scaffold(
        key: _homeKey,
        drawer: HomeDrawer(onPressed: () => context.read<HomeCubit>().logOut()),
      ),
    );
  }
}
