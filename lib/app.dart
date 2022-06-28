import 'package:flutter/material.dart';

import './screens/main_screen.dart';
import './style/theme.dart' as style;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TikTokApp",
      restorationScopeId: 'app',
      theme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Nunito',
              ),
          primaryTextTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Nunito',
              ),
          splashColor: Colors.black.withOpacity(0.0),
          scaffoldBackgroundColor: style.Colors.scaffoldDarkBack,
          primaryColorBrightness: Brightness.dark,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: style.Colors.mainColor,
            selectedIconTheme: IconThemeData(color: style.Colors.mainColor),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
          )),
      home: const MainScreen(),
    );
  }
}
