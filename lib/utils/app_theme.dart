import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      // headlineLarge: GoogleFonts.elMessiri(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //     color: AppColor.whiteColor
      // ),
      //>>>>>>>>>>>  أو<<<<<<<<<<<<<<<<<
      headlineLarge: AppStyles.bold16White,
    ),
  );
}
