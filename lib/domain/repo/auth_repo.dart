abstract class AuthRepo {
  Future<bool> saveAccessToken({required String token});

  Future<bool> readAccessToken();

  Future<bool> deleteToken();
}
