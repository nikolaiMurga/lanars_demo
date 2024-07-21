import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/presentation/home/home_page.dart';

import '../../login/login_page.dart';

class AppNavigator {
  static AppNavigator? _instance;

  AppNavigator._privateConstructor();

  factory AppNavigator() {
    _instance ??= AppNavigator._privateConstructor();
    return _instance!;
  }

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigateBack<T>({T? returnValue}) {
    return navigatorKey.currentState?.pop(returnValue);
  }

  void pushTo(Widget to) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => to));
  }

  void pushReplaceTo(Widget to) {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => to));
  }

  void pushRemoveTo(Widget to) {
    navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => to), (Route<dynamic> route) => false);
  }

  goToLogin() => pushReplaceTo(const LoginPage());

  goToHomePage(BuildContext context) => pushReplaceTo(HomePage(RepositoryProvider.of<AuthRepo>(context)));
}
