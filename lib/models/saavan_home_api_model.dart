// ignore_for_file: public_member_api_docs, sort_constructors_first
class SaavanHomeApiResponse {
  final String status;
  final String? message;
  final SaavanHomeApiResponseData data;

  SaavanHomeApiResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory SaavanHomeApiResponse.fromJson(Map<String, dynamic> json) {
    return SaavanHomeApiResponse(
      status: json['status'],
      message: json['message'],
      data: SaavanHomeApiResponseData.fromJson(json['data']),
    );
  }
}

class SaavanHomeApiResponseData {
  final List<Album> albums;
  final List<Playlist> playlists;
  final List<Chart> charts;
  final Trending trending;

  SaavanHomeApiResponseData({
    required this.albums,
    required this.playlists,
    required this.charts,
    required this.trending,
  });

  factory SaavanHomeApiResponseData.fromJson(Map<String, dynamic> json) {
    return SaavanHomeApiResponseData(
      albums: (json['albums'] as List<dynamic>)
          .map((album) => Album.fromJson(album))
          .toList(),
      playlists: (json['playlists'] as List<dynamic>)
          .map((playlist) => Playlist.fromJson(playlist as Map<String, dynamic>))
          .toList(),
      charts: (json['charts'] as List<dynamic>)
          .map((chart) => Chart.fromJson(chart as Map<String,dynamic>))
          .toList(),
      trending: Trending.fromJson(json['trending']),
    );
  }
}

class Album {
  final String id;
  final String name;
  final String year;
  final String type;
  final String playCount;
  final String language;
  final String explicitContent;
  final String url;
  // final List<Artist> artists;
  final List<SaavanImage> image;
  // final List<dynamic> songs;

  Album({
    required this.id,
    required this.name,
    required this.year,
    required this.type,
    required this.playCount,
    required this.language,
    required this.explicitContent,
    required this.url,
    // required this.artists,
    required this.image,
    // required this.songs,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      type: json['type'],
      playCount: json['playCount'],
      language: json['language'],
      explicitContent: json['explicitContent'],
      url: json['url'],
      // artists: (json['artists'] as List<dynamic>)
      //     .map((artist) => Artist.fromJson(artist as Map<String, dynamic>))
      //     .toList(),
      image: (json['image'] as List<dynamic>)
          .map((img) => SaavanImage.fromJson(img as Map<String, dynamic>))
          .toList(),
      // songs: (json['songs'] as List<dynamic>),
    );
  }

  @override
  String toString() {
    return 'Album(id: $id, name: $name, year: $year, type: $type, playCount: $playCount, language: $language, explicitContent: $explicitContent, url: $url, )';
  }
}

class Artist {
  final String id;
  final String name;
  final String url;
  final List<SaavanImage>? image;
  final String type;
  final String role;

  Artist({
    required this.id,
    required this.name,
    required this.url,
    this.image,
    required this.type,
    required this.role,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      image: json['image'] == true
          ? [] // Handle the case when image is true
          : (json['image'] as List<dynamic>)
              .map((img) => SaavanImage.fromJson(img))
              .toList(),
      type: json['type'],
      role: json['role'],
    );
  }
}

class Playlist {
  final String id;
  final String userId;
  final String title;
  final String subtitle;
  final String type;
  final List<SaavanImage> image;
  final String url;
  final String songCount;
  final String firstname;
  final String followerCount;
  final String lastUpdated;
  final String explicitContent;

  Playlist({
    required this.id,
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.image,
    required this.url,
    required this.songCount,
    required this.firstname,
    required this.followerCount,
    required this.lastUpdated,
    required this.explicitContent,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      subtitle: json['subtitle'],
      type: json['type'],
      image: (json['image'] as List<dynamic>)
          .map((img) => SaavanImage.fromJson(img as Map<String,dynamic>))
          .toList(),
      url: json['url'],
      songCount: json['songCount'],
      firstname: json['firstname'],
      followerCount: json['followerCount'],
      lastUpdated: json['lastUpdated'],
      explicitContent: json['explicitContent'],
    );
  }
}

class Chart {
  final String id;
  final String title;
  final String subtitle;
  final String type;
  final List<SaavanImage> image;
  final String url;
  final String firstname;
  final String explicitContent;
  final String language;

  Chart({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.image,
    required this.url,
    required this.firstname,
    required this.explicitContent,
    required this.language,
  });

  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      type: json['type'],
      image: (json['image'] as List<dynamic>)
          .map((img) => SaavanImage.fromJson(img as Map<String ,dynamic>))
          .toList(),
      url: json['url'],
      firstname: json['firstname'],
      explicitContent: json['explicitContent'],
      language: json['language'],
    );
  }
}

class Trending {
  final List<Song> songs;
  final List<Album> albums;

  Trending({
    required this.songs,
    required this.albums,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      songs: (json['songs'] as List<dynamic>)
          .map((song) => Song.fromJson(song as Map<String, dynamic>))
          .toList(),
      albums: (json['albums'] as List<dynamic>)
          .map((album) => Album.fromJson(album as Map<String, dynamic> ))
          .toList(),
    );
  }
}

class Song {
  final String id;
  final String name;
  final String type;
  // final Album album;
  final String year;
  final String releaseDate;
  final String duration;
  final String label;
  // final List<Artist> primaryArtists;
  // final List<Artist> featuredArtists;
  final String explicitContent;
  final String playCount;
  final String language;
  final String url;
  final List<SaavanImage> image;

  Song({
    required this.id,
    required this.name,
    required this.type,
    // required this.album,
    required this.year,
    required this.releaseDate,
    required this.duration,
    required this.label,
    // required this.primaryArtists,
    // required this.featuredArtists,
    required this.explicitContent,
    required this.playCount,
    required this.language,
    required this.url,
    required this.image,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      // album: Album.fromJson(json['album']), diffrent thant other album
      year: json['year'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
      label: json['label'],
      // primaryArtists: (json['primaryArtists'] as List<dynamic>)
      //     .map((artist) => Artist.fromJson(artist))
      //     .toList(),
      // featuredArtists: (json['featuredArtists'] as List<dynamic>)
      //     .map((artist) => Artist.fromJson(artist))
          // .toList(),
      explicitContent: json['explicitContent'],
      playCount: json['playCount'],
      language: json['language'],
      url: json['url'],
      image: (json['image'] as List<dynamic>)
          .map((img) => SaavanImage.fromJson(img as Map<String, dynamic> ))
          .toList(),
    );
  }
}

class SaavanImage {
  final String quality;
  final String link;

  SaavanImage({
    required this.quality,
    required this.link,
  });

  factory SaavanImage.fromJson(Map<String, dynamic> json) {
    return SaavanImage(
      quality: json['quality'],
      link: json['link'],
    );
  }
}
