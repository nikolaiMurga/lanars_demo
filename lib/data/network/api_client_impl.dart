import 'package:dio/dio.dart';
import 'package:lanars_demo/data/network/responses/random_user_response.dart';
import 'package:retrofit/http.dart';

import 'api_client.dart';
import 'endpoints.dart';
import 'requests/login_request.dart';

part 'api_client_impl.g.dart';

@RestApi()
abstract class ApiClientImpl extends ApiClient {
  factory ApiClientImpl(Dio dio) = _ApiClientImpl;

  @override
  @GET(Endpoints.login)
  Future<RandomUserResponse> login(@Body() LoginRequest request);
}
