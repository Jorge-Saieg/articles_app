import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/article.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleListItem({Key? key, required this.article, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title, maxLines: 2),
      trailing: Column(
        children: [
          const SizedBox(height: 8),
          Text(DateFormat('dd/MM/yyyy HH:mm').format(article.publishDate)),
        ],
      ),
      onTap: onTap,
    );
  }
}
