import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class YoutubeApi {
  static const String baseURL =
      "https://node-yt-music-api-server-bzogg1wxv-pavan6476252.vercel.app";
  static const String searchMusicEndPoint = "/search/musics?query=";

  static const String SEARCH_ALBUMS_ENDPOINT =
      "/search/albums?query=Human%20after%20all";
  static const String SEARCH_PLAYLIST_ENDPOINT = "/search/playlists?query=Jazz";
  static const String GET_ALBUMS_ENDPOINT =
      "/get/album-songs?albumId=YOUR_ALBUM_ID";
  static const String GET_PLAYLISTS_ENDPOINT =
      "/get/playlist-songs?playlistId=YOUR_PLAYLIST_ID";
  static const String SEARCH_FOR_ARTISTS_ENDPOINT =
      "/search/artists?query=Daft%20Punk";
  static const String GET_ARTISTS_INFO_ENDPOINT =
      "/get/artist?artistId=YOUR_ARTIST_ID";
  static const String _getSeachSuggestions =
      "https://python-music-server.vercel.app/suggestions?query=";

  static const String getSuggestionsEndPoint = "/get/suggestions?youtubeId=";

  static Future<Response> searchMusic(String query) async {
    return await http.get(Uri.parse(
        'https://node-yt-music-api-server-bzogg1wxv-pavan6476252.vercel.app/api/search/musics?query=$query'));
  }

  static getSearchSuggestions({required String search}) async {
    return await http.get(Uri.parse(
        'https://python-music-server.vercel.app/suggestions?query=$search'));
  }

  static Future<Response> getVideoSuggestions(String youtubeID) async {
    return await http
        .get(Uri.parse(baseURL + getSuggestionsEndPoint + youtubeID));
  }
}
