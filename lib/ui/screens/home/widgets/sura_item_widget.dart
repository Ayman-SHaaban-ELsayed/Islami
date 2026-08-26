import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;

  const SuraItemWidget({super.key, required this.index});
//
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return Row(
      spacing: width * .04,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vector),
            Text("${index + 1}", style: AppStyles.bold14White),
          ],
        ),
        Column(
          spacing: height * .01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResources.ayaNumberList[index]} Versus',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
