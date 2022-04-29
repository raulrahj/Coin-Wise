import 'dart:async';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/screens/intro_screens/onboarding_screen.dart';
import 'package:coin_wise/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
bool isSplash=true;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    TransactionDbFunctions.instance.refreshData();
    CategoryFunctions.instance.refreshUI();
    // TransactionDbFunctions.instance.getWallet();
    ProflieDb().refreshProfile();
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        checkLogin(context);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: defaultPrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height * .62 / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: const Text(
                  'Coin Wise',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    fontFamily: 'Antic',
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    './assets/images/log.jpg',
                    width: 100,
                    height: 100,
                  )
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return Align(
                  alignment: Alignment.center,
                  child: SizeTransition(sizeFactor: animation));
            });
}

Future<void> checkLogin(context) async {
  final ProfileModel? logData = await ProflieDb().getProfileData();
  bool? isLogged = logData?.isLogged;
  FocusManager.instance.primaryFocus?.unfocus();
  // return isLogged;
  if (isLogged != null || isLogged == true) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext ctx) {
      return const HomePage();
    }), (route) => false);
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const IntroScreen()));
  }
}
