import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';

class SuraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  final bool isSuraDetailsScreen1;

  const SuraAppBar({
    super.key,
    required this.index,
    required this.isSuraDetailsScreen1,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.appPrimaryColor),
      backgroundColor: AppColor.blackColor,
      title: Text(
        QuranResources.englishQuranSuraList[index],
        style: AppStyles.bold20Primary,
      ),
      actions: [
        Switch(
          value: isSuraDetailsScreen1,
          activeThumbColor: AppColor.appPrimaryColor,
          inactiveThumbColor: AppColor.appPrimaryColor,
          inactiveTrackColor: AppColor.whiteColor,

          onChanged: (value) {
            if (value) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.suraDetailsScreenRouteName,
                arguments: index,
              );
            } else {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.suraDetailsScreenRouteName2,
                arguments: index,
              );
            }
          },
        ),
      ],
    );
  }

  // appbar

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
