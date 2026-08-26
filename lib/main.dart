import 'package:flutter/material.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/ui/home_screen.dart';
import 'package:islami/ui/on_boarding_page.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details/sura_details_screen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardScreenRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardScreenRouteName: (context) => OnBoardingPage(),
        AppRoutes.suraDetailsScreenRouteName:(context) => SuraDetailsScreen()
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
