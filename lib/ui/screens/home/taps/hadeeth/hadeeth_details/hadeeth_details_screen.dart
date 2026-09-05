import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeeth_details_args.dart';
import 'package:islami/ui/screens/home/taps/hadeeth/widget/hadeth_text_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class HadeethDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethDetailsArgs;
    var width = context.width;
    var height = context.height;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.appPrimaryColor),
        backgroundColor: AppColor.blackColor,
        title: Text('Hadith ${args.index}', style: AppStyles.bold20Primary),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.suraDetailsBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Text(args.hadeeth!.title, style: AppStyles.bold24Primary),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:  width * .04,vertical: height*.06),
                  child: HadethTextWidget(
                    text: args.hadeeth!.content,
                    textStyle: AppStyles.bold20Primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .12),
          ],
        ),
      ),
    );
  }
}