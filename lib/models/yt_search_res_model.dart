// ignore_for_file: public_member_api_docs, sort_constructors_first
class YTMusicItemList {
  final List<YTMusicItem>? list;
  const YTMusicItemList({this.list});
  factory YTMusicItemList.fromJson(List<dynamic> list) {
    return YTMusicItemList(
        list: list
            .map((item) => YTMusicItem.fromJson(item as Map<String, dynamic>))
            .toList());
  }

  YTMusicItemList copyWith({
    List<YTMusicItem>? list,
  }) {
    return YTMusicItemList(
      list: list ?? this.list,
    );
  }
}

class YTMusicItem {
  final String? youtubeId;
  final String? title;
  final List<Artist>? artists;
  final String? album;
  final String? thumbnailUrl;
  final DurationInfo? duration;
  final bool? isExplicit;

  YTMusicItem({
    this.youtubeId,
    this.title,
    this.artists,
    this.album,
    this.thumbnailUrl,
    this.duration,
    this.isExplicit,
  });

  factory YTMusicItem.fromJson(Map<String, dynamic> json) {
    return YTMusicItem(
      youtubeId: json['youtubeId'],
      title: json['title'],
      artists: List<Artist>.from(json['artists']
          .map((artist) => Artist.fromJson(artist as Map<String, dynamic>))),
      album: json['album'],
      thumbnailUrl: json['thumbnailUrl'],
      duration: DurationInfo.fromJson(json['duration']),
      isExplicit: json['isExplicit'],
    );
  }
}

class Artist {
  final String? name;
  final String? id;

  Artist({this.name, this.id});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      id: json['id'],
    );
  }
}

class DurationInfo {
  final String? label;
  final int? totalSeconds;

  DurationInfo({this.label, this.totalSeconds});

  factory DurationInfo.fromJson(Map<String, dynamic> json) {
    return DurationInfo(
      label: json['label'],
      totalSeconds: json['totalSeconds'],
    );
  }
}
