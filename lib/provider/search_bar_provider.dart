import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:syncmusic/api/youtube/youtubeApi.dart';
import 'package:syncmusic/service/hive_services.dart';

class SearchBarProvider extends ChangeNotifier {
  TextEditingController? textEditingController;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SearchResults _oldSearches = SearchResults(searchItems: []);
  SearchResults get getOldSearches => _oldSearches;

  SearchResults _newSearches = SearchResults(searchItems: []);
  SearchResults get getNewSearches => _newSearches;

  SearchBarProvider() {
    getSearchHistory();
    textEditingController = TextEditingController();
  }

  getSearchSuggestions(String term) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response response = await YoutubeApi.getSearchSuggestions(search: term);
      if (response.statusCode == 200) {
        _newSearches = SearchResults.fromJson(await jsonDecode(response.body));
      } else {
        _newSearches = SearchResults(searchItems: []);
        print(response.statusCode);
      }
      // _newSearches = SearchResults(searchItems: [
      //   SearchItem(title: "title"),
      //   SearchItem(title: "title ds dfsd fdsfsdfffewrw f"),
      //   SearchItem(title: "title dfdd sdf sf sdsd fsdf df "),
      //   SearchItem(title: "titlesd dfef df dfd "),
      //   SearchItem(title: "title asasd sa"),
      // ]);
    } catch (e) {
      print("erro while getting search suggestions");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getSearchHistory() async {
    try {
      final box = Hive.box('syncmusic');
      final jsonString = await box.get('searches');
      if (jsonString != null) {

        _oldSearches = SearchResults.fromJson(jsonDecode(jsonString));

      }
    } catch (e) {
      print(e);
       
    } finally {
      notifyListeners();
    }

    print("hello");
  }

  Future<void> updateSearchHistory(String term) async {
    try {
      final box = Hive.box('syncmusic');
      SearchResults searchResults = getOldSearches;

      SearchResults newSearchResults =
          searchResults.addSearchItem(searchItem: SearchItem(title: term));

      box.put('searches', jsonEncode(newSearchResults.toJson()));

      _oldSearches = newSearchResults;

      notifyListeners();
    } catch (e) {
      print("Error while storing a new item");
    }
  }
}
