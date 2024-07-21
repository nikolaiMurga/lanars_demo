import 'package:flutter/material.dart';

import 'presentation/common/helpers/app_navigator.dart';
import 'presentation/splash/splash_page.dart';
import 'resources/app_theme.dart';

class LanarsDemoApp extends StatelessWidget {
  const LanarsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorKey: AppNavigator.navigatorKey,
      home: const SplashPage(),
    );
  }
}
