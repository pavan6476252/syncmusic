import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/components/search_bar.dart';
import 'package:syncmusic/provider/search_bar_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            toolbarHeight: 12,
            automaticallyImplyLeading: false,
            floating: false, // Set floating to false to pin the app bar
            pinned: true, // Set pinned to true to keep it at the top
            title: null, // Hide the title
            leading: null, // Hide the leading widget
            bottom: MySearchBar(),
          )
        ],
        body: Consumer<SearchBarProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.getNewSearches.searchItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              value.getNewSearches.searchItems[index].title,
                            ),
                            trailing: const Icon(Icons.grain_sharp),
                            onTap: () {
                              context
                                  .read<SearchBarProvider>()
                                  .updateSearchHistory(value
                                      .getNewSearches.searchItems[index].title);
                              context.push('/search-results', extra: {
                                "query": value
                                    .getNewSearches.searchItems[index].title
                              });
                            },
                          ),
                        );
                      },
                    ),
                    Divider(),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 15),
                    //   child: Text(
                    //     "History",
                    //     style: textTheme.titleLarge,
                    //   ),
                    // ),
                    (value.getOldSearches.searchItems.isEmpty)
                        ? ListTile(
                            title: Text("Empty search history"),
                            trailing: const Icon(Icons.error),
                          )
                        : SizedBox.shrink(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.getOldSearches.searchItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              value.getOldSearches.searchItems[index].title,
                            ),
                            trailing: const Icon(Icons.history),
                            onTap: () {
                              context
                                      .read<SearchBarProvider>()
                                      .textEditingController?.text =
                                  value.getOldSearches.searchItems[index].title;
                              context.push('/search-results', extra: {
                                "query": value
                                    .getOldSearches.searchItems[index].title
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    ));
  }
}
