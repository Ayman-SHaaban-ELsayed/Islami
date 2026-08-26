import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Most Recently', style: AppStyles.bold16White),
        SizedBox(
          height: context.height * .18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: context.width * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.appPrimaryColor,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Al-Anbiya", style: AppStyles.bold24Black),
                        Text("الأنبياء", style: AppStyles.bold24Black),
                        Text("112 Versus", style: AppStyles.bold14Black),
                      ],
                    ),
                    Image.asset(AppAssets.quranSuraImage),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: context.width * .04);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
