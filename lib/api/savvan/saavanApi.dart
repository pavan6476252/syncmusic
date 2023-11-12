import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:syncmusic/api/API.dart';
import 'package:syncmusic/utils/strings.dart';

class SaavanApi {
  static String url = 'https://saavan-music-api.vercel.app/';

  static Future<Response> homePage(
      {required List<String> lang}) async {
    return await http
        .get(Uri.parse('${url}modules?language=${lang.join(',')}'));
  }

  static Future<Response> searchSongs(
      {required String query, int page = 0}) async {
    return await http
        .get(Uri.parse('${url}search/songs?query=$query&page=$page&limit=20'));
  }
  static Future<Response> searchAlbums(
      {required String query, int page = 0}) async {
    return await http
        .get(Uri.parse('${url}search/albums?query=$query&page=$page&limit=20'));
  }
  static Future<Response> searchArtists(
      {required String query, int page = 0}) async {
    return await http
        .get(Uri.parse('${url}search/artists?query=$query&page=$page&limit=20'));
  }
  static Future<Response> searchPlaylists(
      {required String query, int page = 0}) async {
    return await http
        .get(Uri.parse('${url}search/playlists?query=$query&page=$page&limit=20'));
  }

  // get individual Response

  static Future<Response> getSongDetails({required String songId}) async {
    return await API.getRequest(
        url:'$url${SaavanStrings.songDetails}5WXAlMNt');
  }

  static Future<Response> getAlbumDetails({required String albumId}) async {
    return await API.getRequest(
        url:'$url${SaavanStrings.albumDetails}xe6Gx7Sg12U_');
  }

  static Future<Response> getArtistDetails({required String songId}) async {
    return await API.getRequest(
        url: '$url${SaavanStrings.artistDetails}C4hxFiXrHws_');
  }

  static Future<Response> getPlaylistDetails({required String artistId}) async {
    return await API.getRequest(
        url:'$url${SaavanStrings.playlistDetails}159144718');
  }
  static Future<Response> getLyrics({required String lyricsId}) async {
    return await API.getRequest(
        url:'$url${SaavanStrings.getLyrics}mPTrDSun');
  }
}
