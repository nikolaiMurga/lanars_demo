import 'package:flutter/material.dart';

import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/presentation/common/helpers/app_navigator.dart';
import 'package:lanars_demo/presentation/common/widgets/active_button.dart';

import '../../resources/app_strings.dart';

class HomePage extends StatelessWidget {
  final AuthRepo _authRepo;

  const HomePage(this._authRepo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActiveButton(
          text: AppStrings.logout,
          isActive: true,
          onPressed: () async {
            await _authRepo.deleteToken();
            AppNavigator().goToLogin();
          },
        ),
      ),
    );
  }
}
