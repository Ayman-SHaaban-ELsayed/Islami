import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/taps/hadeeth/hadeeth_tab.dart';
import 'package:islami/ui/screens/home/taps/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/taps/radio/radio_tab.dart';
import 'package:islami/ui/screens/home/taps/sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/taps/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabList = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColor.appPrimaryColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: AppColor.whiteColor,
          unselectedItemColor: AppColor.blackColor,
          selectedLabelStyle: AppStyles.bold12White,
          showUnselectedLabels: false,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          // backgroundColor: AppColor.appPrimaryColor,
          // type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavBarItem(
              iconName: AppAssets.quranIcon,
              label: "Quran",
              index: 0,
            ),
            _buildBottomNavBarItem(
              iconName: AppAssets.hadeethIcon,
              label: "Hadeeth",
              index: 1,
            ),
            _buildBottomNavBarItem(
              iconName: AppAssets.sebhaIcon,
              label: "Sebha",
              index: 2,
            ),
            _buildBottomNavBarItem(
              iconName: AppAssets.radioIcon,
              label: "Radio",
              index: 3,
            ),
            _buildBottomNavBarItem(
              iconName: AppAssets.timeIcon,
              label: "Time",
              index: 4,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              spacing: context.height * .01,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .155),
                  child: Image.asset(
                    AppAssets.islamLogoImage,
                    height: context.height * .160,
                    width: context.width * .695,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(child: tabList[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({
    required String iconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColor.blackBgColor,
              ),
              child: ImageIcon(AssetImage(iconName)),
            )
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
