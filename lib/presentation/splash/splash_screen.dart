import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_images.dart';
import '../common/helpers/app_navigator.dart';
import '../common/helpers/toast_mixin.dart';
import 'bloc/splash_cubit.dart';

class SplashScreen extends StatelessWidget with ToastMixin {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFailed) showErrorToast(context, state.error);
        if (state is LoggedOut) AppNavigator().goToLogin();
        if (state is LoggedIn) AppNavigator().goToLogin();
      },
      child: Scaffold(
        body: Center(child: Image.asset(AppImages.logo)),
      ),
    );
  }
}
