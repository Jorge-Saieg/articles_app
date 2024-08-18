import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts_app/generated/l10n.dart';
import '../../domain/entities/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('${S.of(context).by}: ${S.of(context).userId} ${article.id}',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(DateFormat('dd/MM/yyyy HH:mm').format(article.publishDate),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Text(article.content, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Text(article.content, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
