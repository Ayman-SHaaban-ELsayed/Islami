import 'package:flutter/material.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home_screen.dart';
import 'package:islami/ui/on_boarding_page.dart';
import 'package:islami/ui/screens/home/taps/hadeeth/hadeeth_details/hadeeth_details_screen.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details/sura_details_screen.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details2/sura_details_screen2.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardScreenRouteName: (context) => OnBoardingPage(),
        AppRoutes.suraDetailsScreenRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.hadeethDetailsScreenRouteName: (context) =>
            HadeethDetailsScreen(),
        AppRoutes.suraDetailsScreenRouteName2: (context) =>
            SuraDetailsScreen2(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
