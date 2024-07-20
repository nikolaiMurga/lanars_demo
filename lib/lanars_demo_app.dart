import 'package:flutter/material.dart';

import 'presentation/splash/splash_page.dart';

class LanarsDemoApp extends StatelessWidget {
  const LanarsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashPage());
  }
}
