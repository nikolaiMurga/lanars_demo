import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  // Access token
  final String _accessTokenKey = 'access_token';

  Future<bool> saveAccessToken({required String token}) async {
    await _storage.write(key: _accessTokenKey, value: token);
    return true;
  }

  Future<String?> readAccessToken() async {
    try {
      final uuid = await _storage.read(key: _accessTokenKey);
      return uuid;
    } on Exception catch (_) {
      await clearAll();
      return null;
    }
  }

  Future<void> clearAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // Delete tokens
  Future<bool> clearAll() async {
    await _storage.deleteAll();
    return true;
  }
}
