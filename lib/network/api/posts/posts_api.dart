import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/network/api/auth/requests/auth_request.dart';
import 'package:breach_assessment/network/api/auth/response/auth_response.dart';
import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/api/posts/request/posts_query.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/network/api/posts/response/posts_response.dart';
import 'package:breach_assessment/network/exceptions/data_transformer.dart';
import 'package:breach_assessment/network/net_utils/api_path.dart' show ApiPath;
import 'package:breach_assessment/network/net_utils/dio_network_provider.dart';
import 'package:breach_assessment/network/net_utils/headers.dart';
import 'package:dio/dio.dart';

abstract class PostsApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<CategoriesData> getCategories() async {
    final response = await _tokenProvider.call(
      path: ApiPath.getCategories,
      method: RequestMethod.get,
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
          (p0) => CategoriesData.fromJson(p0),
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

  static Future<PostsData> getPosts(PostsQuery query) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getPosts,
      method: RequestMethod.get,
      queryParams: query.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
          (p0) => PostsData.fromJson(p0),
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