import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncmusic/api/saavanApi.dart';
import 'package:syncmusic/api/youtube/youtubeApi.dart';
import 'package:syncmusic/models/yt_search_res_model.dart';

import '../utils/api_error_handling.dart';

class YTSearchResultsProvider extends ChangeNotifier {
  ApiErrorHandling<YTMusicItemList> _apiErrorHandling =
      ApiErrorHandling(data: null, error: true, errorMsg: "not loadded yet");
  ApiErrorHandling<YTMusicItemList> get getApiData => _apiErrorHandling;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isfetchingMore = false;
  bool get isFetchingMore => _isfetchingMore;

  bool _fetchError = false;
  bool get getFetchError => _fetchError;
  Future<void> fetchMore() async {
    _isfetchingMore = true;
    notifyListeners();
    try {
      int ran = Random().nextInt(_apiErrorHandling.data?.list!.length ?? 0);
      Response response = await YoutubeApi.searchMusic(_apiErrorHandling
              .data?.list![ran].artists
              ?.map((e) => e.name)
              .join(',') ??
          "latest songs");

      if (response.statusCode == 200) {
        _apiErrorHandling = _apiErrorHandling.copyWith(
            data: YTMusicItemList(list: [
          ..._apiErrorHandling.data!.list ?? [],
          ...YTMusicItemList.fromJson((await jsonDecode(response.body))).list ??
              [],
        ]));
      } else {
        _fetchError = true;
      }
    } catch (e) {
      _fetchError = true;
    } finally {
      _isfetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> searchYoutube({required String query}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response response = await YoutubeApi.searchMusic(query);

      if (response.statusCode == 200) {
        _apiErrorHandling = ApiErrorHandling(
            data: YTMusicItemList.fromJson((await jsonDecode(response.body))),
            error: false,
            errorMsg: 'none');
      } else {
        _apiErrorHandling = ApiErrorHandling(
            data: null, error: true, errorMsg: response.statusCode.toString());
      }
    } catch (e) {
      _apiErrorHandling =
          ApiErrorHandling(data: null, error: true, errorMsg: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
