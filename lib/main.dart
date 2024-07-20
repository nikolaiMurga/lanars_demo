import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'data/repo_impl/auth_repo_impl.dart';
import 'data/repo_impl/secure_storage.dart';
import 'domain/repo/auth_repo.dart';
import 'lanars_demo_app.dart';

void main() {
  const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  final SecureStorage secureStorage = SecureStorage(flutterSecureStorage);
  final AuthRepo authRepo = AuthRepoImpl(secureStorage);

  runApp(MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepo>(create: (context) => authRepo),
      ],
      child: const LanarsDemoApp()));
}
