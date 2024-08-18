import '../../core/api/api_client.dart';
import '../models/article_model.dart';

class ArticleRemoteDataSource {
  final ApiClient apiClient;

  ArticleRemoteDataSource(this.apiClient);

  Future<List<ArticleModel>> getArticles() async {
    try {
      final response = await apiClient.getArticles();
      return response.map((json) => ArticleModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
