import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_texnomart/presenter/pages/dashboard/dashboard_page.dart';
import 'package:flutter_texnomart/presenter/pages/favourite/favourite_page.dart';
import 'package:flutter_texnomart/presenter/pages/map_list/map_list_page.dart';
import 'package:flutter_texnomart/presenter/pages/shops_location/shops_location.dart';
import 'package:flutter_texnomart/presenter/pages/shops_location_all/shops_location_all_page.dart';
import 'package:flutter_texnomart/presenter/pages/splash/splash_page.dart';

import 'data/source/local/hive_helper.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveHelper.init();
  setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFfbc100),
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashPage(),
        'dashboard': (context) => const DashboardPage(0),
        'fav': (context) => const FavouritePage(),
        'map': (context) => const ShopsLocationPage(),
        'mapList': (context) => const MapListPage(),
        'mapLocAll': (context) => const ShopsLocationALl(),
      },
    );
  }
}
