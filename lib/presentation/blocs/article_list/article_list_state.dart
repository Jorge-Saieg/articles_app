import '../../../domain/entities/article.dart';

abstract class ArticleListState {}

class ArticleListInitial extends ArticleListState {}

class ArticleListLoading extends ArticleListState {}

class ArticleListLoaded extends ArticleListState {
  final List<Article> articles;

  ArticleListLoaded(this.articles);
}

class ArticleListError extends ArticleListState {
  final String message;

  ArticleListError(this.message);
}
