import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/saavan_home_api_model.dart';
import '../../../provider/browse_home_provider.dart';

class BrowseSongsTab extends StatefulWidget {
  const BrowseSongsTab({super.key});

  @override
  State<BrowseSongsTab> createState() => _BrowseSongsTabState();
}

class _BrowseSongsTabState extends State<BrowseSongsTab> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // if (Provider.of<BrowserHomeProvider>(context, listen: false).getApiData ==
      //     null) {
        Provider.of<BrowserHomeProvider>(context, listen: false)
            .fetchSaavanHomeData();
      // }
    });
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<BrowserHomeProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (data.getApiData != null) {
          List<List<Song>> hrLsongs = [];
          List<List<Album>> hrLAlbums = [];

          for (int i = 0;
              i < data.getApiData!.data!.data.trending.songs.length;
              i += 3) {
            int end = i + 3;
            if (end > data.getApiData!.data!.data.trending.songs.length) {
              end = data.getApiData!.data!.data.trending.songs.length;
            }

            hrLsongs.add(
                data.getApiData!.data!.data.trending.songs.sublist(i, end));
          }

          for (int i = 0;
              i < data.getApiData!.data!.data.trending.albums.length;
              i++) {
            int end = i + 3;
            if (end > data.getApiData!.data!.data.trending.albums.length) {
              end = data.getApiData!.data!.data.trending.albums.length;
            }
            hrLAlbums.add(
                data.getApiData!.data!.data.trending.albums.sublist(i, end));
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Albums", style: textTheme.titleLarge),
                ),
              ),
              SliverToBoxAdapter(child: _renderHomeAlbums(data, textTheme)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Trending Songs", style: textTheme.titleLarge),
                ),
              ),
              SliverToBoxAdapter(
                  child: _renderTrendingSongs(context, hrLsongs, textTheme)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Charts", style: textTheme.titleLarge),
                ),
              ),
              SliverToBoxAdapter(
                child: _renderSongs(data, textTheme),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Trending Albums", style: textTheme.titleLarge),
                ),
              ),
              SliverToBoxAdapter(
                  child: _renderTrendingAlbums(context, hrLAlbums, textTheme)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Playlists", style: textTheme.titleLarge),
                ),
              ),
              SliverToBoxAdapter(child: _renderHomePlaylists(data, textTheme))
            ],
          );
        } else {
          return ElevatedButton(
            onPressed: () {
              Provider.of<BrowserHomeProvider>(context, listen: false)
                  .fetchSaavanHomeData();
            },
            child: const Text("fetch"),
          );
        }
      },
    );
  }

  SizedBox _renderSongs(BrowserHomeProvider data, TextTheme textTheme) {
    return SizedBox(
        height: 130,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.getApiData!.data!.data.charts.length,
            itemBuilder: (context, index) {
              final chart = data.getApiData!.data!.data.charts[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                            chart.image[chart.image.length - 1].link),
                      ),
                      Text(
                        chart.title.length <= 15
                            ? chart.title
                            : chart.title.substring(0, 11) + '...',
                        style: textTheme.titleMedium,
                      )
                    ]),
              );
            }));
  }

  SizedBox _renderTrendingSongs(
      BuildContext context, List<List<Song>> hrLsongs, TextTheme textTheme) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: hrLsongs.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hrLsongs[index].length,
              itemBuilder: (context, idx) {
                final song = hrLsongs[index][idx];

                return ListTile(
                  leading: CachedNetworkImage(
                      width: 60, height: 60, imageUrl: song.image.last.link),
                  title: Text(
                    song.name,
                    style: textTheme.titleMedium,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    ' ${song.language} | ${song.label} | ${song.year}',
                    maxLines: 1,
                    style: textTheme.bodyMedium!.copyWith(
                      overflow: TextOverflow.clip,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  _renderTrendingAlbums(
      BuildContext context, List<List<Album>> hrLAlbums, TextTheme textTheme) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: hrLAlbums.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hrLAlbums[index].length,
              itemBuilder: (context, idx) {
                final album = hrLAlbums[index][idx];

                return ListTile(
                  leading: CachedNetworkImage(
                      width: 60, height: 60, imageUrl: album.image.last.link),
                  title: Text(
                    album.name,
                    style: textTheme.titleMedium,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    ' ${album.language} | ${album.year}',
                    maxLines: 1,
                    style: textTheme.bodyMedium!.copyWith(
                      overflow: TextOverflow.clip,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  SizedBox _renderHomeAlbums(BrowserHomeProvider data, TextTheme textTheme) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.getApiData!.data!.data.albums.length,
        itemBuilder: (BuildContext context, int index) {
          Album album = data.getApiData!.data!.data.albums[index];
          return Padding(
            padding: EdgeInsets.only(right: 16.0, left: index == 0 ? 15 : 0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: album.image[album.image.length - 1].link,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  album.name.length <= 20
                      ? album.name
                      : album.name.substring(0, 15) + '...',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _renderHomePlaylists(BrowserHomeProvider data, TextTheme textTheme) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.getApiData!.data!.data.playlists.length,
        itemBuilder: (BuildContext context, int index) {
          Playlist playlist = data.getApiData!.data!.data.playlists[index];
          return Padding(
            padding: EdgeInsets.only(right: 16.0, left: index == 0 ? 15 : 0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: playlist.image[playlist.image.length - 1].link,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  playlist.title.length <= 20
                      ? playlist.title
                      : playlist.title.substring(0, 15) + '...',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  @override
  bool get wantKeepAlive =>true;
}
