import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SaavanApi {
  static String url = 'https://saavan-music-api.vercel.app/';
  
  static Future<Response> getSaavanHomePageContent(
      {required List<String> lang}) async {
    // return await http
    //     .get(Uri.parse('${url}modules?language=telugu'));
    return await http
        .get(Uri.parse('${url}modules?language=${lang.join(',')}'));
  }

  static Future<Response> getSaavanSongSearch(
      {required String query, int page = 0}) async {
    return await http
        .get(Uri.parse('${url}search/songs?query=$query&page=$page&limit=10'));
  }
}
