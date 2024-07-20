import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_client.dart';

part 'api_client_impl.g.dart';

@RestApi()
abstract class ApiClientImpl extends ApiClient{
  factory ApiClientImpl(Dio dio) = _ApiClientImpl;

  // @override
  // @GET(Endpoints.catsFact)
  // Future<CatsFactResponse> fetchCatsFact();
  //
  // @override
  // @GET(Endpoints.catsImage)
  // Future<List<CatsImageDto>> fetchCatsImage();

}