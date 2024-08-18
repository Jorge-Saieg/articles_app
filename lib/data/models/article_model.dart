import 'package:intl/intl.dart';

import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    required int id,
    required String title,
    required String content,
    required int userId,
    required DateTime publishDate,
  }) : super(
          id: id,
          title: title,
          content: content,
          userId: userId,
          publishDate: publishDate,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      userId: json['userId'] ?? 0,
      publishDate: DateFormat("dd/MM/yyyy HH:mm:ss").tryParse(json['publishedAt']) ?? DateTime(2000),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': userId,
      'publishedAt': publishDate.toIso8601String(),
    };
  }
}
