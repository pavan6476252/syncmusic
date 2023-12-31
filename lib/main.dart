import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/provider/browse_home_provider.dart';
import 'package:syncmusic/provider/search_bar_provider.dart';
import 'package:syncmusic/routes/go_route_config.dart';

import 'provider/youtube_search_res_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox('syncmusic');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BrowserHomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchBarProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => YTSearchResultsProvider(),
          )
        ],
        child: MaterialApp.router(
          routerConfig: GoRouteConfig.goRouter,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark),
            useMaterial3: true,
          ),
        ));
  }
}
