import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/size_utils.dart';

import 'radio_item_card.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;

  final List<String> radioList = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];

  final List<String> recitersList = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    var height = context.height;

    List<String> currentList = isRadioSelected ? radioList : recitersList;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColor.blackBgColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isRadioSelected = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * .042,
                    decoration: BoxDecoration(
                      color: isRadioSelected
                          ? AppColor.appPrimaryColor
                          : AppColor.transparentColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Radio',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isRadioSelected
                            ? AppColor.blackColor
                            : AppColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isRadioSelected = false;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * .042,

                    decoration: BoxDecoration(
                      color: !isRadioSelected
                          ? AppColor.appPrimaryColor
                          : AppColor.transparentColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Reciters',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: !isRadioSelected
                            ? AppColor.blackColor
                            : AppColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: height * .019),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: currentList.length,
            itemBuilder: (context, index) {
              return RadioItemCard(
                key: ValueKey(currentList[index]),
                title: currentList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
