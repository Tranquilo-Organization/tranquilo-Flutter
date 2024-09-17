import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tranquilo_app/core/network/api_constants.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_request_body.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_response_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
