import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable(createToJson: false)
class Article {
  @JsonKey(defaultValue: 'Unknown')
  final String author;
  final String? title;
  final String? description;
  final String? url;
  @JsonKey(name: 'urlToImage')
  final String? imageUrl;
  final String? publishedAt;
  final String? content;
  final ArticleSource source;

  Article({
    required this.author,
    this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.publishedAt,
    this.content,
    required this.source,
  });
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@JsonSerializable(createToJson: false)
class ArticleSource {
  final String? id;
  final String? name;

  ArticleSource(this.id, this.name);
  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);
}
