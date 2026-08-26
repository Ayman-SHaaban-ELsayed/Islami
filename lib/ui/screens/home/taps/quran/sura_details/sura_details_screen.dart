import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details/sura_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class SuraDetailsScreen extends StatefulWidget {
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  // const SuraDetailsScreen({super.key});
  List<String> versus = [];
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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.appPrimaryColor),
        backgroundColor: AppColor.blackColor,
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Column(
        spacing: height * .02,
        children: [
          Row(
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
          Expanded(
            child: versus.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.appPrimaryColor,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      // print(index);
                      return SuraContent(
                        content: versus[index].trim(),
                        index: index,
                        isSelected: selectedIndex == index,
                        onTap: () {
                          if (selectedIndex != index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * .009);
                    },
                    itemCount: versus.length,
                  ),
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
      print(lines[i]);
    }
    versus = lines;

    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
