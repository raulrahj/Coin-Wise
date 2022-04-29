import 'package:coin_wise/main.dart';
import '../../constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/constants/functions.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:coin_wise/screens/intro_screens/splash_screen.dart';
import 'package:coin_wise/screens/intro_screens/profile_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showDoneButton: false,
          showSkipButton: false,
          showNextButton: false,
          scrollPhysics:
              const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          done: const Text('Get Started'),
          onDone: () {},
          onSkip: () {},
          pages: [
            PageViewModel(
              image: Image.asset('./assets/images/onboard1.jpg', scale: 3.5),
              titleWidget: const Text(
                'All in one mobile appication',
                style: onboardTitle,
              ),
              bodyWidget: const Text(
                'Track your Financial activity just a few seconds',
              ),
            ),
            PageViewModel(
                decoration: const PageDecoration(
                  imageAlignment: Alignment(1, 00),
                  imageFlex: 2,
                ),
                image: Image.asset('./assets/images/onboardlast.png'),
                footer: ElevatedButton(
                  onPressed: () {
                    defaultCategoryAdding();
                    isSplash
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (ctx) => SetupProfile()),
                          )
                        : navigatorKey?.currentState?.pop();
                  },
                  child: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    primary: defaultColor,
                    onPrimary: Colors.white,
                    shadowColor: defaultColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    minimumSize: const Size(180, 40),
                  ),
                ),
                titleWidget: const Text(
                  'Save Money with Coin Wise',
                  style: onboardTitle,
                ),
                body: ' '),
          ],
        ),
      ),
    );
  }
}
