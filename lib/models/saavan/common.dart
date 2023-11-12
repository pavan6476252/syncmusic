
class ImageInfo {
  String quality;
  String link;

  ImageInfo({
    required this.quality,
    required this.link,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      quality: json['quality'],
      link: json['link'],
    );
  }
}

class DownloadUrlInfo {
  String quality;
  String link;

  DownloadUrlInfo({
    required this.quality,
    required this.link,
  });

  factory DownloadUrlInfo.fromJson(Map<String, dynamic> json) {
    return DownloadUrlInfo(
      quality: json['quality'],
      link: json['link'],
    );
  }
}

