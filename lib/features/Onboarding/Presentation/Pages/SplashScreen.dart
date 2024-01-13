import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import '../../../../cache/colors/colors.dart';
import 'onboarding_view.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation =
        Tween<double>(begin: .2, end: 1.2).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Splash)),
          child: FadeTransition(
            opacity: animation!,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/onboarding/onpboarding_splash.png',
                fit: BoxFit.cover,
                height: 90,
              ),
            ),
          )),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingView()));
    });
  }
}
