import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lanars_demo/data/repo_impl/local_repo.dart';

import 'data/db/persistence_helper.dart';
import 'data/network/api_client.dart';
import 'data/network/api_client_impl.dart';
import 'data/repo_impl/auth_repo_impl.dart';
import 'data/repo_impl/network_repo.dart';
import 'data/repo_impl/repo_impl.dart';
import 'data/repo_impl/secure_storage.dart';
import 'domain/mappers/user_mapper.dart';
import 'domain/repo/auth_repo.dart';
import 'domain/repo/repo.dart';
import 'lanars_demo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PersistenceHelper.initHive();
  const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  final SecureStorage secureStorage = SecureStorage(flutterSecureStorage);
  final AuthRepo authRepo = AuthRepoImpl(secureStorage);
  final Dio dio = Dio();
  final ApiClient apiClient = ApiClientImpl(dio);
  final NetworkRepo networkRepo = NetworkRepo(apiClient);
  final UserMapper userMapper = UserMapper();
  final LocalRepo localRepo = LocalRepo();
  final Repo repo = RepoImpl(networkRepo, authRepo, userMapper, localRepo);

  runApp(MultiBlocProvider(providers: [
    RepositoryProvider<AuthRepo>(create: (context) => authRepo),
    RepositoryProvider<NetworkRepo>(create: (context) => networkRepo),
    RepositoryProvider<Repo>(create: (context) => repo),
  ], child: const LanarsDemoApp()));
}
