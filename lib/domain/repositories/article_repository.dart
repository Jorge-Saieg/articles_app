import '../entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles();
  Stream<List<Article>> watchArticles();
}
