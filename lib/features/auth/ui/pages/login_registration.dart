import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/buttons/skip_button.dart';
import 'package:yadlo/features/auth/ui/pages/login_pages/login_page.dart';
import 'package:yadlo/features/auth/ui/pages/register/registration_page.dart';

class LoginAndRegistration extends StatefulWidget {
  const LoginAndRegistration({super.key});

  @override
  State<LoginAndRegistration> createState() => _LoginAndRegistrationState();
}

class _LoginAndRegistrationState extends State<LoginAndRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: SvgPicture.asset(
              'assets/images/Frame10.svg',
              fit: BoxFit.cover,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180.h,
            ),
            SizedBox(
                height: 90.h,
                width: 90.w,
                child: SvgPicture.asset(
                  'assets/images/loginlogo.svg',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 140.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 5,
                ),
                child: GeneralButton1(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  width: SizeConfig.screenWidth,
                  colors: login1,
                  text: 'LogIn',
                )),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 5,
              ),
              child: GeneralButton1(
                width: SizeConfig.screenWidth,
                text: 'Create an account',
                colors: login1,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RegistrationPage()));
                },
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
             SkipButton(
              text: 'Skip now',
              style: Styles.semiBlod(fontSize: 16)
            )
          ],
        )
      ]),
    );
  }
}
