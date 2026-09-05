import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  // List<int> mostRecentList = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //بيستنى لما يتبنى البرنامج قبل ميتعامل مع البروفيدر
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.readMostRecent();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: context.height * .18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsScreenRouteName,
                      arguments: mostRecentProvider.mostRecentList[index],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * .02,
                    ),
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
                            Text(
                              QuranResources
                                  .englishQuranSuraList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources
                                  .arabicQuranSuraList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources
                                  .arabicQuranSuraList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.quranSuraImage),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: context.width * .04);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }

  // void getMostRecentList() async {
  //   mostRecentList = await readMostRecent();
  //   setState(() {});
  // }
}
