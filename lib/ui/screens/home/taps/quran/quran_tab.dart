import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/screens/home/taps/quran/widgets/most_recent_widget.dart';
import 'package:islami/ui/screens/home/taps/quran/widgets/sura_item_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/shared_pref_utils.dart';
import 'package:islami/utils/size_utils.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    // var height=MediaQuery.of(context).size.height;
    // var width=MediaQuery.of(context).size.width;
    //  أو من كلاس احنا عاملينة فاليوتلز
    // var height=SizeConfig.getHeight(context: context);
    // var width=SizeConfig.getWidth(context: context);
    //أو باضافة الكونتكست  الى ال
    //BuildContext
    //عن طريق استخدام الاكستنشن
    var height = context.height;
    var width = context.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * .02,
          children: [
            TextField(
              style: AppStyles.bold20White,
              cursorColor: AppColor.appPrimaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.blackBgColor,
                enabledBorder: _buildDecorationBorder(),
                focusedBorder: _buildDecorationBorder(),
                prefixIcon: Image.asset(AppAssets.quranIcon),
                hintText: 'Sura Name',
                hintStyle: Theme.of(context).textTheme.headlineLarge,
                //    أو
                // hintStyle: AppStyles.bold16White
                //أو
                // hintStyle: TextStyle(
                //   fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //   color: AppColor.whiteColor
                // )
              ),
              onChanged: (text) {
                searchBySuraName(text);
              },
            ),
            MostRecentWidget(),
            Text('Suras List', style: AppStyles.bold16White),
            filterList.isEmpty
                ? Center(
                    child: Text(
                      'No Sura Name Found',
                      style: AppStyles.bold20Primary,
                    ),
                  )
                : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //save last sura index in shared pref
                          saveLastSuraIndex(filterList[index]);
                          //navigate to details
                          Navigator.of(context).pushNamed(
                            AppRoutes.suraDetailsScreenRouteName,
                            arguments: filterList[index],
                          );
                        },
                        child: SuraItemWidget(index: filterList[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                        color: AppColor.whiteColor,
                        endIndent: width * .06,
                        indent: width * .06,
                        height: height * .02,
                      );
                    },
                    itemCount: filterList.length,
                  ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.appPrimaryColor, width: 2),
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    if (suraName.isEmpty) {
      filterList = List.generate(114, (index) => index);
      setState(() {});
      return;
    }
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        suraName.toLowerCase(),
      )) {
        searchList.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].contains(suraName)) {
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //بيستنى لما يتبنى البرنامج قبل ميتعامل مع البروفيدر
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.readMostRecent();
    });
  }
  // Future<List<int>> readTheMostRecent() async {
  //   var list = await mostRecentProvider.mostRecentList;
  //
  //   return list;
  // }
}
