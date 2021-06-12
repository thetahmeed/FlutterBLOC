import 'articles.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Articles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((e) => e.toJson()).toList(),
    };
  }
}
