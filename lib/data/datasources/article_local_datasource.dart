import 'package:hive/hive.dart';
import '../../domain/entities/article.dart';

class ArticleLocalDataSource {
  final Box<Article> articlesBox;

  ArticleLocalDataSource(this.articlesBox);

  Future<void> cacheArticles(List<Article> articles) async {
    await articlesBox.clear();
    await articlesBox.addAll(articles);
  }

  List<Article> getCachedArticles() {
    return articlesBox.values.toList();
  }

  Stream<List<Article>> watchArticles() {
    return articlesBox.watch().map((_) => articlesBox.values.toList());
  }
}
