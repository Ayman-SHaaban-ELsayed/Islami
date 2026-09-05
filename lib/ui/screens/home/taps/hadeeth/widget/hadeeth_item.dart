import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeeth.dart';
import 'package:islami/model/hadeeth_details_args.dart';
import 'package:islami/ui/screens/home/taps/hadeeth/widget/hadeth_text_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeethFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return hadeeth == null
        ? Center(child: CircularProgressIndicator(color: AppColor.blackColor))
        : InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.hadeethDetailsScreenRouteName,
                arguments: HadeethDetailsArgs(
                  hadeeth: hadeeth,
                  index: widget.index,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: height * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.appPrimaryColor,
                image: DecorationImage(
                  image: AssetImage(AppAssets.hadithCardBgImg),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .02,
                          vertical: height * .01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppAssets.leftCornerImage,
                              color: AppColor.blackColor,
                            ),

                            Image.asset(
                              AppAssets.rightCornerImage,
                              color: AppColor.blackColor,
                            ),
                          ],
                        ),
                      ),
                      HadethTextWidget(
                        text: hadeeth?.title ?? '',
                        textStyle: AppStyles.bold24Black,
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: HadethTextWidget(
                          text: hadeeth?.content ?? '',
                          textStyle: AppStyles.bold16Black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void loadHadeethFile() async {
    String hadeethContent = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );
    String title = hadeethContent.substring(0, hadeethContent.indexOf('\n'));

    String content = hadeethContent.substring(hadeethContent.indexOf('\n') + 1);
    hadeeth = Hadeeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
