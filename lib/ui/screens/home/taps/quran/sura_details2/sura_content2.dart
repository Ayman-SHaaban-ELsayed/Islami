import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class SuraContent2 extends StatefulWidget {
  final String content;

  const SuraContent2({super.key, required this.content});

  @override
  State<SuraContent2> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent2> {
  @override
  Widget build(BuildContext context) {
    // print('here: [${index + 1}] $content ');
    // print("======");
    // print(index);
    // print("=======");
    var screenWidth = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Text(
        widget.content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20Primary,
      ),
    );
  }
}
