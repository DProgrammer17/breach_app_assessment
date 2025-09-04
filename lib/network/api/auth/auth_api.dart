import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/network/api/auth/requests/auth_request.dart';
import 'package:breach_assessment/network/api/auth/response/auth_response.dart';
import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/exceptions/data_transformer.dart';
import 'package:breach_assessment/network/net_utils/api_path.dart' show ApiPath;
import 'package:breach_assessment/network/net_utils/dio_network_provider.dart';
import 'package:breach_assessment/network/net_utils/headers.dart';
import 'package:dio/dio.dart';

abstract class AuthApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<AuthResponse> signUp({
    required AuthRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.signUp,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
          (p0) => AuthResponse.fromJson(p0),
      response,
    );
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<AuthResponse> login({
    required AuthRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.login,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
          (p0) => AuthResponse.fromJson(p0),
      response,
    );
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }
}