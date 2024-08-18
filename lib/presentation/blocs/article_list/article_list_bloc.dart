import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_articles.dart';
import 'article_list_event.dart';
import 'article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final GetArticles getArticles;

  ArticleListBloc(this.getArticles) : super(ArticleListInitial()) {
    on<FetchArticles>((event, emit) async {
      emit(ArticleListLoading());
      try {
        final articles = await getArticles();
        if (articles.isEmpty) {
          emit(ArticleListError('🤷‍♂️'));
        }
        emit(ArticleListLoaded(articles));
      } catch (e) {
        emit(ArticleListError(e.toString()));
      }
    });
  }
}
