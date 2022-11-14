// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: json['author'] as String? ?? 'Unknown',
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      imageUrl: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
      source: ArticleSource.fromJson(json['source'] as Map<String, dynamic>),
    );

ArticleSource _$ArticleSourceFromJson(Map<String, dynamic> json) =>
    ArticleSource(
      json['id'] as String?,
      json['name'] as String?,
    );
