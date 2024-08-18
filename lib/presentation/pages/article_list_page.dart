import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/app_constants.dart';
import 'package:posts_app/generated/l10n.dart';
import 'package:posts_app/routes.dart';
import '../blocs/article_list/article_list_bloc.dart';
import '../blocs/article_list/article_list_event.dart';
import '../blocs/article_list/article_list_state.dart';
import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';
import '../widgets/article_list_item.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
          ),
        ],
      ),
      body: BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (context, state) {
          if (state is ArticleListInitial) {
            context.read<ArticleListBloc>().add(FetchArticles());
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ArticleListLoading) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 20),
                Text(S.of(context).loadingMessage),
              ],
            ));
          } else if (state is ArticleListLoaded) {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<ArticleListBloc>().add(FetchArticles());
              },
              child: ListView.separated(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final article = state.articles[index];
                  return ArticleListItem(
                    article: article,
                    onTap: () {
                      router.push(AppConstants.ARTICLE_DETAIL_ROUTE, extra: article);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness: 2, height: 2, color: Colors.grey[300]),
              ),
            );
          } else if (state is ArticleListError) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).errorMessage),
                IconButton(
                    icon: const Icon(Icons.info_outline_rounded),
                    iconSize: 20, // Tamaño del ícono
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('⚠️', textAlign: TextAlign.center),
                              content: Text(state.message, textAlign: TextAlign.center),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(S.of(context).close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }),
              ],
            ));
          }
          return Container();
        },
      ),
    );
  }
}
