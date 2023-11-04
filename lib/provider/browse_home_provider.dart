import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart'; 
import 'dart:convert';

import '../api/saavanApi.dart';
import '../models/saavan_home_api_model.dart';
import '../utils/api_error_handling.dart';

class BrowserHomeProvider with ChangeNotifier {
  ApiErrorHandling<SaavanHomeApiResponse>? _apiErrorHandling;
  ApiErrorHandling<SaavanHomeApiResponse>? get getApiData => _apiErrorHandling;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSaavanHomeData() async {
    try {
      _isLoading = true;
      notifyListeners();

      Response response =
          await SaavanApi.getSaavanHomePageContent(lang: ['telugu']);

      if (response.statusCode == 200) {
        
        _apiErrorHandling = ApiErrorHandling(
            data:
                SaavanHomeApiResponse.fromJson(await jsonDecode(response.body)),
            error: false,
            errorMsg: 'none');
      } else {
        _apiErrorHandling = ApiErrorHandling(
            data: null, error: true, errorMsg: response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      _apiErrorHandling =
          ApiErrorHandling(data: null, error: true, errorMsg: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
