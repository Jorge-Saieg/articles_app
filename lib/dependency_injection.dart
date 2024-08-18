import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_app/core/utils/app_constants.dart';
import 'core/api/api_client.dart';
import 'data/datasources/article_remote_datasource.dart';
import 'data/datasources/article_local_datasource.dart';
import 'data/repositories/article_repository_impl.dart';
import 'domain/repositories/article_repository.dart';
import 'domain/usecases/get_articles.dart';
import 'presentation/blocs/article_list/article_list_bloc.dart';
import 'presentation/blocs/theme/theme_bloc.dart';
import 'domain/entities/article.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  final articlesBox = await Hive.openBox<Article>(AppConstants.HIVE_BOX_NAME);

  // Core
  getIt.registerLazySingleton(() => ApiClient());

  // Data sources
  getIt.registerLazySingleton(() => ArticleRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => ArticleLocalDataSource(articlesBox));

  // Repositories
  getIt.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(getIt(), getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetArticles(getIt()));

  // BLoCs
  getIt.registerFactory(() => ArticleListBloc(getIt()));
  getIt.registerFactory(() => ThemeBloc());
}
