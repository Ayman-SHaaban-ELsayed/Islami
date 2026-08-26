import 'package:flutter/material.dart';

//طريقة 1
class SizeConfig {
  static double getWidth({required BuildContext context}) =>
      MediaQuery.of(context).size.width;

  static double getHeight({required BuildContext context}) =>
      MediaQuery.of(context).size.height;
  // //ويتم الاستدعاء بالطريقة:
  //   var height=SizeConfig.getHeight(context: context);
  //   var width=SizeConfig.getWidth(context: context);
}

//طريقة 2
extension SizeUtils on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
