import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/screens/search/tabs/yt_tabs/yt_album_search_tab.dart';
import 'package:syncmusic/screens/search/tabs/yt_tabs/yt_artists_search_tab.dart';
import 'package:syncmusic/screens/search/tabs/yt_tabs/yt_search_songs_tab.dart';

import '../../../provider/yt_providers/yt_song_search_res_provider.dart';
import '../../../utils/utils.dart';
import 'yt_tabs/yt_playlists_search_tab.dart';

class YoutubeSearchResultsTab extends StatefulWidget {
  const YoutubeSearchResultsTab({super.key, required this.query});
  final String query;

  @override
  State<YoutubeSearchResultsTab> createState() =>
      _YoutubeSearchResultsTabState();
}

class _YoutubeSearchResultsTabState extends State<YoutubeSearchResultsTab>
    with AutomaticKeepAliveClientMixin {
  void initState() {
    super.initState();
    
  }

  ScrollController scrollController = ScrollController();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) {
            _currentIndex = value;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.music_note), label: "Songs"),
            NavigationDestination(
                icon: Icon(Icons.album_rounded), label: "Albums"),
            NavigationDestination(
                icon: Icon(Icons.person_3_outlined), label: "Artists"),
            NavigationDestination(
                icon: Icon(Icons.playlist_play_sharp), label: "Plalists")
          ]),
      body:  [
        YTSongsSearchResultsTab(query: widget.query),
        YTAlbumSearchTab(query:widget.query),
        YTArtistsSearchTab(query:widget.query),
        YTPlaylistsSearchTab(query:widget.query),
        
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
