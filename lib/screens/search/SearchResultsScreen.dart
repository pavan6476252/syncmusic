import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; 
import 'package:syncmusic/screens/search/tabs/saavan_search_tab.dart';
import 'package:syncmusic/screens/search/tabs/youtube_search_results_tab.dart';

import '../../components/my_sliver_home_tabar.dart';
import '../../components/search_bar.dart';
import '../../utils/costants.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.query});

  final String query;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late TabController tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    // tabController.addListener(() {
    //   setState(() {
    //     tabIndex = tabController.index;
    //     print(tabIndex);
    //   });
    // });
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 12,
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                title: null,
                leading: null,
                bottom: MySearchBar(
                  onTap: () => {context.push('/search')},
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: "Youtube"),
                      Tab(text: "Saavan"),
                    ],
                  ),
                ),
                floating: true,
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              YoutubeSearchResultsTab(query: widget.query),
              SaavanSearchResultsTab(query: widget.query),
            ],
          ),
        ),
      ),
       
    );
  }
}
