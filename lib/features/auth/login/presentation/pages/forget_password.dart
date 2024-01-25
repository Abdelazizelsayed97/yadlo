import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';
import 'package:yadlo/features/auth/login/presentation/pages/pass_recovery.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .050,
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
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: SizeConfig.defaultSize! * 3.5),
                    width: SizeConfig.defaultSize! * 20,
                    child: const CustomStyle22(
                      text: 'Forgot Password',
                    )),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: SizeConfig.defaultSize! * 3),
                  width: SizeConfig.defaultSize! * 24,
                  child: const CustomStyle12(
                      text:
                          "Enter your Email that you registered with and we will send you a code to verify and reset your password"),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: SizeConfig.defaultSize! * 4),
                  height: 190.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(padding: EdgeInsets.only(top: SizeConfig.defaultSize!*3),
                    width: SizeConfig.defaultSize! * 29,

                    child: TextForm2(
                      text: '*Email', hintText: '',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 250.h,
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 62),
              child: GeneralButton2(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SetNewPass()));
              },
                colors: them,
                width: SizeConfig.defaultSize! * 22,
                child: const Text(
                  'Send',
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
          ),

        ],
      ),
    );
  }
}
