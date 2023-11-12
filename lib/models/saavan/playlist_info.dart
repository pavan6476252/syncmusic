
import 'package:syncmusic/models/saavan/common.dart';

class PlaylistDetailsResponse {
  String status;
  String? message;
  PlaylistDetailsData data;

  PlaylistDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PlaylistDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PlaylistDetailsResponse(
      status: json['status'],
      message: json['message'],
      data: PlaylistDetailsData.fromJson(json['data']),
    );
  }
}

class PlaylistDetailsData {
  String id;
  String userId;
  String name;
  String followerCount;
  String songCount;
  String fanCount;
  String username;
  String firstname;
  String lastname;
  String shares;
  List<ImageInfo> image;
  String url;
  List<SongInfo> songs;

  PlaylistDetailsData({
    required this.id,
    required this.userId,
    required this.name,
    required this.followerCount,
    required this.songCount,
    required this.fanCount,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.shares,
    required this.image,
    required this.url,
    required this.songs,
  });

  factory PlaylistDetailsData.fromJson(Map<String, dynamic> json) {
    return PlaylistDetailsData(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      followerCount: json['followerCount'],
      songCount: json['songCount'],
      fanCount: json['fanCount'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      shares: json['shares'],
      image: List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x))),
      url: json['url'],
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

 