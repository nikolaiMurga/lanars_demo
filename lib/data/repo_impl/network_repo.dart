import 'package:lanars_demo/data/network/api_client.dart';
import 'package:lanars_demo/data/network/dto/user_dto.dart';
import 'package:lanars_demo/data/network/requests/login_request.dart';

class NetworkRepo {
  final ApiClient _apiClient;

  NetworkRepo(this._apiClient);

  Future<UserDto> login({required LoginRequest request}) async {
    final resp = await _apiClient.login(request);
    return resp.results!.first;
  }
}
