  
import 'package:syncmusic/models/saavan/common.dart';
import 'package:syncmusic/models/saavan/song_info.dart';

class AlbumResponse {
  String status;
  String? message;
  AlbumData data;

  AlbumResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AlbumResponse.fromJson(Map<String, dynamic> json) {
    return AlbumResponse(
      status: json['status'],
      message: json['message'],
      data: AlbumData.fromJson(json['data']),
    );
  }
}

class AlbumData {
  String id;
  String name;
  String year;
  String releaseDate;
  String songCount;
  String url;
  String primaryArtistsId;
  String primaryArtists;
  // List<dynamic> featuredArtists; // In case there are featured artists
  // List<dynamic> artists; // In case there are additional artists
  List<ImageInfo> image;
  List<SongInfo> songs;

  AlbumData({
    required this.id,
    required this.name,
    required this.year,
    required this.releaseDate,
    required this.songCount,
    required this.url,
    required this.primaryArtistsId,
    required this.primaryArtists,
    // required this.featuredArtists,
    // required this.artists,
    required this.image,
    required this.songs,
  });

  factory AlbumData.fromJson(Map<String, dynamic> json) {
    return AlbumData(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      releaseDate: json['releaseDate'],
      songCount: json['songCount'],
      url: json['url'],
      primaryArtistsId: json['primaryArtistsId'],
      primaryArtists: json['primaryArtists'],
      // featuredArtists: List<dynamic>.from(json['featuredArtists']),
      // artists: List<dynamic>.from(json['artists']),
      image: List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x))),
      songs: List<SongInfo>.from(json['songs'].map((x) => SongInfo.fromJson(x))),
    );
  }
}

class SongInfo {
  String id;
  String name;
  AlbumInfo album;
  String year;
  String releaseDate;
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

  SongInfo({
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

  factory SongInfo.fromJson(Map<String, dynamic> json) {
    return SongInfo(
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
      image: List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x))),
      downloadUrl: List<DownloadUrlInfo>.from(
          json['downloadUrl'].map((x) => DownloadUrlInfo.fromJson(x))),
    );
  }
}
 
 