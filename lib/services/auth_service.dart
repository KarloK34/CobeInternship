import 'package:dio/dio.dart';
import 'package:first_project/models/auth_response.dart';
import 'package:first_project/models/token.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/auth_service.g.dart';

@Singleton()
@RestApi(baseUrl: "https://cope-hive-wtsg6fob5q-ew.a.run.app")
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST("/sign_in")
  Future<AuthResponse> signIn(@Body() Map<String, dynamic> credentials);

  @POST("/refresh_token")
  Future<Token> refreshToken(@Body() Map<String, dynamic> token);
}
