import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/screens/search/tabs/saavan_tabs/saavan_song_search_tab.dart';

import '../../../provider/yt_providers/yt_song_search_res_provider.dart';
import '../../../utils/costants.dart';
import '../../../utils/utils.dart';

class SaavanSearchResultsTab extends StatefulWidget {
  const SaavanSearchResultsTab({super.key, required this.query});
  final String query;

  @override
  State<SaavanSearchResultsTab> createState() => _SaavanSearchResultsTabState();
}

class _SaavanSearchResultsTabState extends State<SaavanSearchResultsTab>
    with AutomaticKeepAliveClientMixin {
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});

    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     fetchmore();
    //   }
    // });
  }

  ScrollController scrollController = ScrollController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context); 

    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) => setState(() {
                _currentIndex = value;
              }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.music_note), label: "Songs"),
            NavigationDestination(
                icon: Icon(Icons.album_rounded), label: "Albums"),
            NavigationDestination(
                icon: Icon(Icons.person_3_outlined), label: "Artists"),
            NavigationDestination(
                icon: Icon(Icons.playlist_play_sharp), label: "Plalists")
          ]), 

          body: [
            SaavanSongSearchTab(query: widget.query),
            Text("data2"),
            Text("data3"),
            Text("data4"),
          ][_currentIndex],
    );
  }

  @override
  bool get wantKeepAlive => true;

  // void fetchmore() {
  //   if (!Provider.of<YTSearchResultsProvider>(context, listen: false)
  //       .isFetchingMore) {
  //     Provider.of<YTSearchResultsProvider>(context, listen: false).fetchMore();
  //   }
  // }
}
