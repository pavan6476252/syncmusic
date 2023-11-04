import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncmusic/api/saavanApi.dart';
import 'package:syncmusic/api/youtube/youtubeApi.dart';
import 'package:syncmusic/models/yt_search_res_model.dart';

import '../utils/api_error_handling.dart';

class YTSearchResultsProvider extends ChangeNotifier {
  ApiErrorHandling<YTMusicItemList>? _apiErrorHandling;
  ApiErrorHandling<YTMusicItemList>? get getApiData => _apiErrorHandling;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> searchYoutube({required String query}) async {
    try {
      _isLoading = true;
      notifyListeners();

      Response response = await YoutubeApi.searchMusic(query);
      // Response saavanResponse = await SaavanApi.getSaavanSongSearch(query: query);

      if (response.statusCode == 200) {
        _apiErrorHandling = ApiErrorHandling(
            data: YTMusicItemList.fromJson(
                (await jsonDecode(response.body)) as List<dynamic>),
            error: false,
            errorMsg: 'none');
        // print("yt search ");
        // print(await response.body);
      } else {
        print("yt search " + response.statusCode.toString());
        _apiErrorHandling = ApiErrorHandling(
            data: null, error: true, errorMsg: response.statusCode.toString());
      }
    } catch (e) {
      print("Yt search provider  :" + e.toString());
      _apiErrorHandling =
          ApiErrorHandling(data: null, error: true, errorMsg: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
