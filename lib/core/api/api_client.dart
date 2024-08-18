import 'package:dio/dio.dart';
import 'package:posts_app/core/utils/app_constants.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConstants.API_BASE_URL),
  );

  Future<List<dynamic>> getArticles() async {
    final response = await _dio.get(AppConstants.ARTICLES_ENDPOINT);
    return response.data;
  }
}
