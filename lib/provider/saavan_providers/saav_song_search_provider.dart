import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncmusic/api/savvan/saavanApi.dart';
import 'package:syncmusic/models/saavan/song_info.dart';

import '../../utils/api_error_handling.dart';

class SaavanSongSearchProvider extends ChangeNotifier {
  ApiErrorHandling<SaavanSongsInfoResponse> _apiErrorHandling =
      ApiErrorHandling(data: null, error: true, errorMsg: "not loadded yet");
  ApiErrorHandling<SaavanSongsInfoResponse> get getApiData => _apiErrorHandling;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isfetchingMore = false;
  bool get isFetchingMore => _isfetchingMore;

  bool _fetchError = false;
  bool get getFetchError => _fetchError;

  String _previousQuery = "";
  int _page = 0;

  Future<void> fetchMore() async {
    _isfetchingMore = true;
    _page += 1;

    notifyListeners();
    try {
      Response response =
          await SaavanApi.searchSongs(query: _previousQuery, page: _page);
      List<SongData> newData =
          SaavanSongsInfoResponse.fromJson((await jsonDecode(response.body)))
              .data;

    // fix  this code

      if (response.statusCode == 200) {
        _apiErrorHandling = _apiErrorHandling.copyWith(
            data: _apiErrorHandling.data!.copyWith(
                data: [..._apiErrorHandling.data?.data ?? [], ...newData]));
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

  Future<void> searchSongs({required String query}) async {
    if (_previousQuery == query) return;
    _previousQuery = query;

    try {
      _isLoading = true;
      notifyListeners();
      Response response =
          await SaavanApi.searchSongs(query: _previousQuery, page: _page);

      if (response.statusCode == 200) {
         SaavanSongsInfoResponse.fromJson(
                (await jsonDecode(response.body) as Map<String,dynamic>));
        _apiErrorHandling = ApiErrorHandling(
            data: SaavanSongsInfoResponse.fromJson(
                (await jsonDecode(response.body))),
            error: false,
            errorMsg: 'none');
      } else {
        _apiErrorHandling = ApiErrorHandling(
            data: null, error: true, errorMsg: response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      _apiErrorHandling =
          ApiErrorHandling(data: null, error: true, errorMsg: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
