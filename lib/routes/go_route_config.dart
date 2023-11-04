import 'package:go_router/go_router.dart';
import 'package:syncmusic/screens/Home/HomeScreen.dart';
import 'package:syncmusic/screens/search/SearchResultsScreen.dart';
import 'package:syncmusic/screens/search/SearchScreen.dart';

class GoRouteConfig {
  static final GoRouter goRouter = GoRouter(initialLocation: '/', routes: [
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
  ]);
}
