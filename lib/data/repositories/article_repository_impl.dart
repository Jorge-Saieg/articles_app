import '../../domain/entities/article.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/article_remote_datasource.dart';
import '../datasources/article_local_datasource.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  final ArticleLocalDataSource localDataSource;

  ArticleRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Article>> getArticles() async {
    try {
      final remoteArticles = await remoteDataSource.getArticles();
      await localDataSource.cacheArticles(remoteArticles);
      return remoteArticles;
    } catch (e) {
      return localDataSource.getCachedArticles();
    }
  }

  @override
  Stream<List<Article>> watchArticles() {
    return localDataSource.watchArticles();
  }
}
