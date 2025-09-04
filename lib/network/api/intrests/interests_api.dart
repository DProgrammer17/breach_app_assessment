import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/api/intrests/request/post_interest_request.dart';
import 'package:breach_assessment/network/api/intrests/response/interest_response.dart';
import 'package:breach_assessment/network/exceptions/data_transformer.dart';
import 'package:breach_assessment/network/net_utils/api_path.dart';
import 'package:breach_assessment/network/net_utils/dio_network_provider.dart';
import 'package:breach_assessment/network/net_utils/headers.dart';
import 'package:dio/dio.dart';

abstract class InterestsApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<InterestsData> getInterests({
    required String authToken,
    required int userId,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getInterests(userId),
      method: RequestMethod.get,
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => InterestsData.fromJson(p0),
      response,
    );
    res.either(
          (left) =>
      throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<bool> postUserInterests({
    required String authToken,
    required int userId,
    required PostInterestRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.postInterests(userId),
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => true,
      response,
    );
    res.either(
          (left) =>
      throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

}