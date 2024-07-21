import 'package:lanars_demo/data/repo_impl/secure_storage.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final SecureStorage _secureStorage;

  AuthRepoImpl(this._secureStorage);

  // Access token
  @override
  Future<bool> saveAccessToken({required String token}) async => _secureStorage.saveAccessToken(token: token);

  @override
  Future<bool> readAccessToken() async {
    final token = await _secureStorage.readAccessToken();
    if (token == null) return false;
    return true;
  }

  Future<bool> deleteToken() async => _secureStorage.clearAccessToken();
}
