import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncmusic/components/my_sliver_home_tabar.dart';
import 'package:syncmusic/components/search_bar.dart';
import 'package:syncmusic/screens/Home/widgets/BrowseSongsTab.dart';
import 'package:syncmusic/screens/Home/widgets/HomeForYouSongs.dart';
import 'package:syncmusic/utils/costants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  int currentPageIndex = 0;
  _changeNavigation(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (value) => _changeNavigation(value),
          destinations: Constants.bottomNavigationBarItems),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                  SliverAppBar(
                  title: const Text('SyncMusic'),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: MySearchBar(
                   onTap:  () => {context.push('/search')},
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "For you"),
                        Tab(text: "Browse"),
                      ],
                    ),
                  ),

                  // pinned: true,
                  floating: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [HomeForYouContent(), BrowseSongsTab()],
            )),
      ),
    );
  }
}
