import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/size_utils.dart';

class RadioItemCard extends StatefulWidget {
  final String title;

  const RadioItemCard({super.key, required this.title});

  @override
  State<RadioItemCard> createState() => _RadioItemCardState();
}

class _RadioItemCardState extends State<RadioItemCard> {
  bool isPlaying = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: height * .15,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.appPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              isPlaying ? AppAssets.soundWave1 : AppAssets.mosque_02Image,
              height: height * 0.10,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 40,
                      color: AppColor.blackColor,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30,
                      color: AppColor.blackColor,
                      icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                      onPressed: () {
                        setState(() {
                          isMuted = !isMuted;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
