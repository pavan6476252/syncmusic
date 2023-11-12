// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:syncmusic/models/saavan/common.dart';

class SaavanSongsInfoResponse {
  String status;
  String? message;
  List<SongData> data;

  SaavanSongsInfoResponse({
    required this.status,
    required this.message,
    required this.data,
  });

 factory SaavanSongsInfoResponse.fromJson(Map<String, dynamic> json) {

  return SaavanSongsInfoResponse(
    status: json['status'],
    message: json['message'],
   
    data: List<SongData>.from(
      ((json['data']['results'])as List<dynamic>).map(
        (x) => SongData.fromJson(x as Map<String, dynamic>),
      ),
    ),
  );

  }

  SaavanSongsInfoResponse copyWith({
    String? status,
    String? message,
    List<SongData>? data,
  }) {
    return SaavanSongsInfoResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class SongData {
  String id;
  String name;
  AlbumInfo album;
  String year;
  String? releaseDate;
  String duration;
  String label;
  String primaryArtists;
  String primaryArtistsId;
  String featuredArtists;
  String featuredArtistsId;
  int explicitContent;
  String playCount;
  String language;
  String hasLyrics;
  String url;
  String copyright;
  List<ImageInfo> image;
  List<DownloadUrlInfo> downloadUrl;

  SongData({
    required this.id,
    required this.name,
    required this.album,
    required this.year,
    required this.releaseDate,
    required this.duration,
    required this.label,
    required this.primaryArtists,
    required this.primaryArtistsId,
    required this.featuredArtists,
    required this.featuredArtistsId,
    required this.explicitContent,
    required this.playCount,
    required this.language,
    required this.hasLyrics,
    required this.url,
    required this.copyright,
    required this.image,
    required this.downloadUrl,
  });

  factory SongData.fromJson(Map<String, dynamic> json) {
    return SongData(
      id: json['id'],
      name: json['name'],
      album: AlbumInfo.fromJson(json['album']),
      year: json['year'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
      label: json['label'],
      primaryArtists: json['primaryArtists'],
      primaryArtistsId: json['primaryArtistsId'],
      featuredArtists: json['featuredArtists'],
      featuredArtistsId: json['featuredArtistsId'],
      explicitContent: json['explicitContent'],
      playCount: json['playCount'],
      language: json['language'],
      hasLyrics: json['hasLyrics'],
      url: json['url'],
      copyright: json['copyright'],
      image:
          List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x  as Map<String, dynamic>))),
      downloadUrl: List<DownloadUrlInfo>.from(
          json['downloadUrl'].map((x) => DownloadUrlInfo.fromJson(x  as Map<String, dynamic>))),
    );
  }
}

class AlbumInfo {
  String id;
  String name;
  String url;

  AlbumInfo({
    required this.id,
    required this.name,
    required this.url,
  });

  factory AlbumInfo.fromJson(Map<String, dynamic> json) {
    return AlbumInfo(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
