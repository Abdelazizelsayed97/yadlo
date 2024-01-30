import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/registration/ui/widgets/otp.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});
  @override
  State<Otp> createState() => _AccVrefyState();
}

class _AccVrefyState extends State<Otp> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .1,
            child: ThemeDataApp(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: SizeConfig.defaultSize! * 20,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/passlogo.svg",
                    height: 100.h,
                    width: 100.w,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: SizeConfig.defaultSize! * 20,
                      child: const CustomStyle18(
                          text: "Authenticate your account")),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 220.w,
                    child: const CustomStyle12(
                      text:
                      'Please enter the 4-digit OTP code send to your Email osa******@gmail.com',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child:  Column(
                        children: [
                          verticalSpace(25),
                          OTPVerify(),
                          verticalSpace(15),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomStyle12(text: "Didn't receive a code?"),
                              InkWell(child: StyleFont14(
                                text: '  Resend', fontWeight: FontWeight.w500,))
                            ],
                          ),verticalSpace(15),
                          Container(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 70),
                            child: GeneralButton2(
                              colors: them,
                              width: 200.w,
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Somar Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
