import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int tasbeehIndex = 0;
  double rotationAngle = 0.0;
  List<String> tasbeeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله إلا الله',
    'الله أكبر',
    'لا حول\nولا قوة إلا بالله',
  ];

  void onSebhaTap() {
    setState(() {

      rotationAngle += 0.5;
      counter++;
      if (counter > 33) {
        counter = 1;
        tasbeeh.length - 1 > tasbeehIndex
            ? tasbeehIndex = (tasbeehIndex + 1)
            : tasbeehIndex = 0;
        //طريقة حلوة  tasbeehIndex = (tasbeehIndex + 1) % tasbeeh.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى', style: AppStyles.bold36White),
            Image.asset(AppAssets.sebha2Image, height: height * 0.09),
            GestureDetector(
              onTap: onSebhaTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      AppAssets.sebhaImage,
                      height: height * 0.40,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tasbeeh[tasbeehIndex],
                        style: AppStyles.bold36White,
                        textAlign: TextAlign.center,
                      ),
                      Text('$counter', style: AppStyles.bold36White),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
