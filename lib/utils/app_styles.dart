import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/utils/app_color.dart';

//هنعمل كدة أ, appTheming
class AppStyles {
  static TextStyle bold16White = GoogleFonts.elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
  );
  static TextStyle bold12White = bold16White.copyWith(fontSize: 12);
  static TextStyle bold14White = bold16White.copyWith(fontSize: 14);
  static TextStyle bold20White = bold16White.copyWith(fontSize: 20);
  static TextStyle bold36White = bold16White.copyWith(fontSize: 36);

  //black
  static TextStyle bold24Black = bold16White.copyWith(
    fontSize: 24,
    color: AppColor.blackColor,
  );
  static TextStyle bold14Black = bold24Black.copyWith(fontSize: 14);
  static TextStyle bold20Black = GoogleFonts.elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  //primary
  static TextStyle bold20Primary = GoogleFonts.elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.appPrimaryColor,
  );
  static TextStyle bold24Primary = bold20Primary.copyWith(fontSize: 24);
}
