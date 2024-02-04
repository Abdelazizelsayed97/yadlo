import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';

class SetNewPass extends StatelessWidget {
  const SetNewPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const AppThemeData(),
        Positioned(
         left: 0,
          right: 0,
          top: 150.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // verticalSpace(140),
                  SvgPicture.asset(
                    'assets/images/passlogo.svg',
                    height: 100,
                  ),
                  verticalSpace(45),
                  const CustomStyle22(text: "Set new password"),
                  verticalSpace(38),
                  Container(
                    padding:  EdgeInsetsDirectional.symmetric(horizontal: 25.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19)),
                    height: 300.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextForm2(
                          text: 'Enter New Password',
                          hintText: '',
                        ),
                        TextForm2(
                          text: 'Verify Password',
                          hintText: '',
                        ),
                        GeneralButton1(
                          colors: ig3,
                          text: 'Send',
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
