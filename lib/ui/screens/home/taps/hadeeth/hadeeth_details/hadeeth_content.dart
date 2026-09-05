import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class  HadeethContent extends StatefulWidget {
  final String content;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const HadeethContent({
    super.key,
    required this.content,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<HadeethContent> createState() => _HadeethContentState();
}

class _HadeethContentState extends State<HadeethContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    // print('here: [${index + 1}] $content ');
    // print("======");
    // print(index);
    // print("=======");
    var width = context.width;
    var height = context.height;
    return InkWell(
      onTap: widget.onTap,

      ///<<<<<
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .04),
        padding: EdgeInsets.symmetric(vertical: height * .015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected
              ? AppColor.appPrimaryColor
              : Colors.transparent,

          ///<<<<<
          border: Border.all(color: AppColor.appPrimaryColor, width: 2),
        ),
        child: Text(
          ' ${widget.content} [${widget.index + 1}]',
          // '[${index + 1}] $content ',
          textDirection: TextDirection.rtl,
          style: AppStyles.bold20Primary.copyWith(
            color: widget.isSelected ? Colors.black : AppColor.appPrimaryColor,

            ///<<<<<<<<
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
