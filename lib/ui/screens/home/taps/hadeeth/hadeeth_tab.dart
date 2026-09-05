import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/taps/hadeeth/widget/hadeeth_item.dart';
import 'package:islami/utils/size_utils.dart';

class HadeethTab extends StatelessWidget {
  List<int> numbers = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return CarouselSlider(
      items: numbers.map((index) {
        return HadeethItem(index: index);
      }).toList(),
      options: CarouselOptions(
          height: height * .66, enlargeCenterPage: true,enableInfiniteScroll: false),
    );
  }
}
