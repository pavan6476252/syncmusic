import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncmusic/screens/Home/HomeScreen.dart';
import 'package:syncmusic/screens/audio/audio_full_screen.dart';
import 'package:syncmusic/screens/search/SearchResultsScreen.dart';
import 'package:syncmusic/screens/search/SearchScreen.dart';

import '../screens/search/tabs/saavan_tabs/saavan_song_search_tab.dart';

class GoRouteConfig {
  static final GoRouter goRouter = GoRouter(initialLocation: '/', routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) =>  SaavanSongSearchTab(query: "Leo songs"),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
        path: '/search-results',
        builder: (context, state) {
          Map<String, String>? extra = state.extra as Map<String, String>;
          return SearchResultsScreen(query: extra['query'] ?? "");
        }),
    GoRoute(
      path: '/audio-full-screen',
      // builder: (context, state) => const AudioFullScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const AudioFullScreen(),
      ),
    ),
  ]);
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
