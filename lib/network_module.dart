import 'package:dio/dio.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/token.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    const String signInEndpoint = '/sign_in';
    const String refreshTokenEndpoint = '/refresh_token';
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path != signInEndpoint && options.path != refreshTokenEndpoint) {
            final accessToken = HiveBoxes.token.get(getIt<UserCubit>().state!.id)!.accessToken;
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            final refreshToken = HiveBoxes.token.get(getIt<UserCubit>().state!.id)!.refreshToken;
            try {
              final response = await getIt<AuthService>().refreshToken({'refresh_token': refreshToken});
              final newToken = Token(response.accessToken, response.refreshToken, response.expiresAt);
              HiveBoxes.token.put(getIt<UserCubit>().state!.id, newToken);

              final retryOptions = e.requestOptions;
              retryOptions.headers['Authorization'] = 'Bearer ${newToken.accessToken}';

              final retryResponse = await dio.fetch(retryOptions);
              return handler.resolve(retryResponse);
            } catch (refreshError) {
              print('Token refresh failed: $refreshError');
            }
          }

          return handler.next(e);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
    return dio;
  }
}
