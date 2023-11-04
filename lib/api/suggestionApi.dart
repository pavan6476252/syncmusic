import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SuggestionApi {
  static String url = 'https://python-music-server.vercel.app/';

  static Future<Response> getSuggestions({required String query}) async {
    return await http.get(Uri.parse('$url/suggestions?query=$query'));
  }
}
