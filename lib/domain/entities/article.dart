import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final int userId;

  @HiveField(4)
  final DateTime publishDate;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.publishDate,
  });
}
