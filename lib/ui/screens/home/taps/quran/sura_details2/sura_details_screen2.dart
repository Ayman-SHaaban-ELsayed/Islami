import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_app_bar.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details2/sura_content2.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen2> {
  // const SuraDetailsScreen({super.key});
  String versus = '';

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = context.width;
    var height = context.height;
    if (versus.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: SuraAppBar(index: index,isSuraDetailsScreen1: false,),
      body: Column(
        spacing: height * .02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCornerImage, height: height * .09),
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyles.bold24Primary,
                ),
                Image.asset(AppAssets.rightCornerImage, height: height * .09),
              ],
            ),
          ),
          Expanded(
            child: versus.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.appPrimaryColor,
                    ),
                  )
                : SingleChildScrollView(child: SuraContent2(content: versus)),
          ),
          Image.asset(AppAssets.mosque_02Image, height: height * .12),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    versus = lines.join(' ');

    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
