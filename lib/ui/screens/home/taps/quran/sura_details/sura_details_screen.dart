import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_app_bar.dart';
import 'package:islami/ui/screens/home/taps/quran/sura_details/sura_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  // const SuraDetailsScreen({super.key});
  List<String> versus = [];
  int selectedIndex = -1;
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    var width = context.width;
    var height = context.height;
    if (versus.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: SuraAppBar(index: index, isSuraDetailsScreen1: true),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.suraDetailsBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          spacing: height * .04,
          children: [
            Text(
              QuranResources.arabicQuranSuraList[index],
              style: AppStyles.bold24Primary,
            ),
            Expanded(
              child: versus.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColor.appPrimaryColor,
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .02,
                        vertical: height * .04,
                      ),
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
            SizedBox(height: height * .08),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    lines.removeWhere((line) => line.trim().isEmpty);
    // for (int i = 0; i < lines.length; i++) {
    //   print(lines[i]);
    // }
    versus = lines;

    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMostRecent();
  }
}
