import 'package:lanars_demo/data/network/requests/login_request.dart';
import 'package:lanars_demo/data/network/responses/random_user_response.dart';

abstract class ApiClient {
  Future<RandomUserResponse> login(LoginRequest request);
}