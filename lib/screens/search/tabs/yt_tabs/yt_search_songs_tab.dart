import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/provider/yt_providers/yt_song_search_res_provider.dart';
import 'package:syncmusic/utils/utils.dart';
 

class YTSongsSearchResultsTab extends StatefulWidget {
  const YTSongsSearchResultsTab({super.key, required this.query});
  final String query;

  @override
  State<YTSongsSearchResultsTab> createState() =>
      _YTSongsSearchResultsTabState();
}

class _YTSongsSearchResultsTabState extends State<YTSongsSearchResultsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<YTSongSearchResultsProvider>(context, listen: false)
          .searchYoutube(query: widget.query);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchmore();
      }
    });
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        
        body:
            Consumer<YTSongSearchResultsProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (value.getApiData.error) {
            return Center(
              child: Text("Error: ${value.getApiData.errorMsg}"),
            );
          }

          // Check for errors while fetching more data
          if (value.getFetchError && value.isFetchingMore) {
            Future.delayed(Duration.zero, () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text("Error while fetching more"),
                backgroundColor: Theme.of(context).colorScheme.error,
              ));
            });
          }

          return ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 5),
            itemBuilder: (context, index) {
              if (index == value.getApiData.data!.list!.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final result = value.getApiData.data!.list![index];
              return ListTile(
                leading: CachedNetworkImage(
                    width: 60, height: 60, imageUrl: result.thumbnailUrl ?? ""),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        result.title ?? "",
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                        formatSecondsToMinutesAndSeconds(result.duration!.totalSeconds?.toInt() ?? 0))
                  ],
                ),
                subtitle: Text(
                  ' ${result.artists!.map((e) => e.name).join(' , ')} ',
                  maxLines: 1,
                  style: textTheme.labelMedium!.copyWith(
                    overflow: TextOverflow.clip,
                  ),
                ),
              );
            },
            itemCount: value.getApiData.data!.list!.length + 1,
          );
        }));
  }

  @override
  bool get wantKeepAlive => true;

  void fetchmore() {
    if (!Provider.of<YTSongSearchResultsProvider>(context, listen: false)
        .isFetchingMore) {
      Provider.of<YTSongSearchResultsProvider>(context, listen: false).fetchMore();
    }
  }
}
