import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/provider/youtube_search_res_provider.dart';
import 'package:syncmusic/screens/search/tabs/saavan_search_results_tab.dart';

import '../../components/my_sliver_home_tabar.dart';
import '../../components/search_bar.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.query});

  final String query;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   Provider.of<YTSearchResultsProvider>(context)
    //       .searchYoutube(query: widget.query);
    // });
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: 12,
                  automaticallyImplyLeading: false,
                  floating: false, // Set floating to false to pin the app bar
                  pinned: true, // Set pinned to true to keep it at the top
                  title: null, // Hide the title
                  leading: null, // Hide the leading widget
                  bottom: MySearchBar(
                    onTap: () => {context.push('/search')},
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Saavan"),
                        Tab(text: "Browse"),
                      ],
                    ),
                  ),

                  // pinned: true,
                  floating: true,
                ),
              ];
            },
            body:   TabBarView(
              children: [
                SaavanSearchResultsTab(query :widget.query),
                Icon(Icons.abc),
              ],
            )),
      ),
    );
  }
}
