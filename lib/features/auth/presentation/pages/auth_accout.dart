import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/features/auth/presentation/widgets/otp.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _AccVrefyState();
}

class _AccVrefyState extends State<Otp> {
  TextEditingController _controller = TextEditingController();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/passlogo.svg",
                  height: SizeConfig.defaultSize! * 10,
                  width: SizeConfig.defaultSize! * 10,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: SizeConfig.defaultSize! * 20,
                    child: CustomStyle18(text: "Authenticate your account")),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: SizeConfig.defaultSize! * 24,
                  child: const CustomStyle12(
                    text:
                        'Please enter the 4-digit OTP code send to your Email osa******@gmail.com',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: SizeConfig.defaultSize! * 20,
                  width: SizeConfig.defaultSize! * 32,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomStyle12(text: "Didn't receive a code?"),
                      InkWell(child: StyleFont14(text: '  Resend', fontWeight: FontWeight.w500,))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.defaultSize! * 41,
            child: OTPVerify(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.defaultSize! * 31,
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 70),
              child: GeneralButton2(
                colors: them,
                width: SizeConfig.defaultSize! * 22,
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
          )
        ],
      ),
    );
  }
}
