import 'package:syncmusic/models/saavan_home_api_model.dart';

class SaavanSearchApiResponse {
  final String status;
  final String? message;
  final SaavanSearchApiResponseData data;

  SaavanSearchApiResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory SaavanSearchApiResponse.fromJson(Map<String, dynamic> json) {
    return SaavanSearchApiResponse(
      status: json['status'],
      message: json['message'],
      data: SaavanSearchApiResponseData.fromJson(json['data']),
    );
  }
}

class SaavanSearchApiResponseData {
  // final List<Album> albums;
  // final List<Playlist> playlists;
  final SaavanTopQuery topQuery;

  SaavanSearchApiResponseData({required this.topQuery});

  factory SaavanSearchApiResponseData.fromJson(Map<String, dynamic> json) {
    return SaavanSearchApiResponseData(topQuery: json['topQuery']);
  }
}

class SaavanTopQuery {
  final List<SaavanTopQueryResult>? results;
  SaavanTopQuery({required this.results});

  factory SaavanTopQuery.fromJson(Map<String, dynamic> json) {
    return SaavanTopQuery(
      results: (json['results'] as List<dynamic>)
          .map((result) =>
              SaavanTopQueryResult.fromJson(result as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SaavanTopQueryResult {
  final String? id;
  final String? title;
  final List<SaavanImage>? image;
  final String? url;
  final String? type;
  final String? description;

  const SaavanTopQueryResult({
    this.id,
    this.title,
    this.image,
    this.url,
    this.type,
    this.description,
  });

  factory SaavanTopQueryResult.fromJson(Map<String, dynamic> json) {
    return SaavanTopQueryResult(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
      image: (json['image'] as List<dynamic>)
          .map((img) => SaavanImage.fromJson(img as Map<String, dynamic>))
          .toList(),
    );
  }
}
