 
import 'package:syncmusic/models/saavan/common.dart';

class ArtistDetailsResponse {
  String status;
  String? message;
  ArtistDetailsData data;

  ArtistDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ArtistDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ArtistDetailsResponse(
      status: json['status'],
      message: json['message'],
      data: ArtistDetailsData.fromJson(json['data']),
    );
  }
}

class ArtistDetailsData {
  String id;
  String name;
  String url;
  List<ImageInfo> image;
  String followerCount;
  String fanCount;
  bool isVerified;
  String dominantLanguage;
  String dominantType;
  List<dynamic> bio; // In case there is a bio
  String dob;
  String fb;
  String twitter;
  String wiki;
  List<String> availableLanguages;
  bool isRadioPresent;

  ArtistDetailsData({
    required this.id,
    required this.name,
    required this.url,
    required this.image,
    required this.followerCount,
    required this.fanCount,
    required this.isVerified,
    required this.dominantLanguage,
    required this.dominantType,
    required this.bio,
    required this.dob,
    required this.fb,
    required this.twitter,
    required this.wiki,
    required this.availableLanguages,
    required this.isRadioPresent,
  });

  factory ArtistDetailsData.fromJson(Map<String, dynamic> json) {
    return ArtistDetailsData(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      image: List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x))),
      followerCount: json['followerCount'],
      fanCount: json['fanCount'],
      isVerified: json['isVerified'],
      dominantLanguage: json['dominantLanguage'],
      dominantType: json['dominantType'],
      bio: List<dynamic>.from(json['bio']),
      dob: json['dob'],
      fb: json['fb'],
      twitter: json['twitter'],
      wiki: json['wiki'],
      availableLanguages: List<String>.from(json['availableLanguages']),
      isRadioPresent: json['isRadioPresent'],
    );
  }
}
 