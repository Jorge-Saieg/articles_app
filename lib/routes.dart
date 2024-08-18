import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_app/core/utils/app_constants.dart';
import 'presentation/pages/article_list_page.dart';
import 'presentation/pages/article_detail_page.dart';
import 'domain/entities/article.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppConstants.HOME_ROUTE,
      builder: (BuildContext context, GoRouterState state) => const ArticleListPage(),
    ),
    GoRoute(
      path: AppConstants.ARTICLE_DETAIL_ROUTE,
      name: 'article',
      builder: (BuildContext context, GoRouterState state) {
        final article = state.extra as Article;
        return ArticleDetailPage(article: article);
      },
    ),
  ],
);
