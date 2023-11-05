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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // mini audio player
          GestureDetector(
            onTap: ()=>context.push('/audio-full-screen'),
            child: Hero(
              tag: "HeroOne",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      height: 55,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                'https://c.saavncdn.com/386/Naa-Ready-From-Leo-Tamil-2023-20230622174435-500x500.jpg'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Naa Ready aa !",
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                "Naa Ready aa !",
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                              size: 35,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 2,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ),
          ),

          // bottom navigation
          NavigationBar(
              selectedIndex: currentPageIndex,
              onDestinationSelected: (value) => _changeNavigation(value),
              destinations: Constants.bottomNavigationBarItems),
        ],
      ),
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
                    onTap: () => {context.push('/search')},
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
