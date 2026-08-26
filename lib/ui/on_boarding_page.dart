import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/ui/home_screen.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';

const backgroundImage = AppAssets.islamLogoImage;

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(BuildContext context) {
  //   Navigator.of(
  //     context,
  //   ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  // }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const myTitleTextStyle = TextStyle(
      color: AppColor.appPrimaryColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );
    const myBodyTextStyle = TextStyle(
      color: AppColor.appPrimaryColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        bodyPadding: EdgeInsets.only(top: 200, right: 20, left: 20, bottom: 0),
        globalBackgroundColor: AppColor.blackColor,
        allowImplicitScrolling: true,
        autoScrollDuration: 5000,
        infiniteAutoScroll: true,
        globalHeader: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 30,
                left: 30,
                bottom: 0,
              ),
              child: Image.asset(
                AppAssets.islamLogoImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ), //xxxxxxxxx
            ),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Welcome To Islami App",
            body: "",
            image: Image.asset(
              AppAssets.welcomeImage,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 900,
            ),
            decoration: PageDecoration(
              contentMargin: const EdgeInsets.symmetric(vertical: 60),
              bodyFlex: 2,
              imageFlex: 3,
              titleTextStyle: myTitleTextStyle,
              bodyTextStyle: myBodyTextStyle,
            ),
          ),
          PageViewModel(
            title: "Welcome To Islami",
            body: "We Are Very Excited To Have You In Our Community",
            image: Image.asset(
              AppAssets.welcome2Image,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 1000,
            ),
            decoration: PageDecoration(
              contentMargin: const EdgeInsets.symmetric(vertical: 60),
              bodyFlex: 2,
              imageFlex: 3,
              titleTextStyle: myTitleTextStyle,
              bodyTextStyle: myBodyTextStyle,
            ),
          ),
          PageViewModel(
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
            image: Image.asset(
              AppAssets.welcome3Image,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 1000,
            ),
            decoration: PageDecoration(
              contentMargin: const EdgeInsets.symmetric(vertical: 60),
              bodyFlex: 2,
              imageFlex: 3,
              titleTextStyle: myTitleTextStyle,
              bodyTextStyle: myBodyTextStyle,
            ),
          ),
          PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord,the Most High",
            image: Image.asset(
              AppAssets.welcome4Image,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 1000,
            ),
            decoration: PageDecoration(
              contentMargin: const EdgeInsets.symmetric(vertical: 60),
              pageMargin: EdgeInsets.symmetric(horizontal: 50),
              bodyFlex: 2,
              imageFlex: 3,
              titleTextStyle: myTitleTextStyle,
              bodyTextStyle: myBodyTextStyle,
            ),
          ),
          PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can Listen to the Holy Quran Radio through the Application for free and easily",
            image: Image.asset(
              AppAssets.welcome5Image,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 1000,
            ),
            decoration: PageDecoration(
              // contentMargin:  EdgeInsets.symmetric(horizontal: 70,vertical: 70),
              bodyFlex: 2,
              imagePadding: EdgeInsets.symmetric(
                horizontal: 70,
                // vertical: 70,
              ),
              imageFlex: 3,
              titleTextStyle: myTitleTextStyle,
              bodyTextStyle: myBodyTextStyle,
            ),
          ),
        ],
        onDone: () => {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        },
        // onSkip: () => _onIntroEnd(context),
        // You can override onSkip callback
        showSkipButton: true,

        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Text(
          'Back',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.appPrimaryColor,
          ),
        ),
        skip: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text(
          'Next',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.appPrimaryColor,
          ),
        ),
        done: const Text(
          'Finish',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.appPrimaryColor,
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: AppColor.appPrimaryColor,
          activeSize: Size(22.0, 10.0), //xxxxxxxxx
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        // dotsContainerDecorator: const ShapeDecoration(
        //   color: Colors.black87,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
        //   ),
        // ),
      ),
    );
  }
}
