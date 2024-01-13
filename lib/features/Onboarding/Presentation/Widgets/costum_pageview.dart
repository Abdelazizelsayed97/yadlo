import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/floatingactionbutton.dart';
import 'package:yadlo/features/Onboarding/Presentation/Widgets/custom_indicator.dart';
import 'package:yadlo/features/auth/presentation/pages/login_registration.dart';

import '../../../../core/boarding_assets.dart';
import '../../../../core/buttons/skip_button.dart';
import '../../onboa_model/pageview_model.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController();
  double currentPageIndex = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (value) {
            currentPageIndex = value.toDouble();
            setState(() {});
          },
          controller: _pageController,
          itemCount: onboardPages.length,
          itemBuilder: (context, index) {
            // Get the onboard page at the current index
            OnboardPage onboardPage = onboardPages[index];

            // Return a Container widget with the onboard page details
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: onboardPage.color)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center,
                      width: 300.w,
                      height: 300.h,
                      child: Image.asset(
                        onboardPage.image,
                        fit: BoxFit.cover,
                      )),
                   SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 260.w,
                    child: Text(onboardPage.title,textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 268.w,
                    child: Text(
                      onboardPage.subtitle,textAlign: TextAlign.center,strutStyle: StrutStyle(forceStrutHeight: true),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                   SizedBox(height: 20.h),
                ],
              ),
            );
          },
        ),
        Positioned(
            bottom: 170.h,
            left: 0,
            right: 0,
            child: PageIndicator(
              currentValue: currentPageIndex.toInt(),
            )),
        Positioned(
          bottom: 100.h,
          left: 300.w,
          child: FlaotingActionButton(
            onTap: () {
              if (_pageController.page! <= 1) {
                _pageController?.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginAndRegistration(),
                  ),
                );
              }
            },
          ),
        ),
        Visibility(
          visible: _pageController!.hasClients
              ? (_pageController!.page! < 1 ? true : false)
              : true,
          child: Positioned(
              bottom: 100.h,
              right:  290.w,
              child: SkipButton(
                text: 'Skip',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Somar Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginAndRegistration()));
                },
              )),
        )
      ],
    );
  }
}
