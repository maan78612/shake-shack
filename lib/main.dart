import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/provider/app_provider.dart';
import 'package:shake_shack/helper/theme.dart';

import 'UI/splash_screen.dart';
import 'helper/connectivity_services.dart';
import 'helper/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ConnectivityServices _con = ConnectivityServices();
  @override
  void initState() {
    _con.startConnectionStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shake Shack',
          theme: theme(),
          // home: SplashScreen(),
          // We use routeName so that we don't need to remember the name
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}
