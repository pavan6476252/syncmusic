// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

class SearchResults {
  final List<SearchItem> searchItems;

  SearchResults({required this.searchItems});

  factory SearchResults.fromJson(List<dynamic> json) {
    final List<SearchItem> searchItems =
        json.map((item) => SearchItem(title: item.toString())).toList();
    return SearchResults(searchItems: searchItems);
  }

  List<String> toJson() {
    final List<String> jsonList =
        searchItems.map((item) => item.title).toList();
    return jsonList;
  }

  SearchResults addSearchItem({
    required SearchItem searchItem,
  }) {
    List<SearchItem> searchItems = this.searchItems;
    searchItems.add(searchItem);
    return SearchResults(searchItems: searchItems);
  }
}

class SearchItem {
  final String title;

  SearchItem({required this.title});
}
