import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/presentation/pages/forget_password.dart';
import 'package:yadlo/features/auth/presentation/pages/registration_page.dart';
import 'package:yadlo/features/auth/presentation/widgets/divider.dart';
import 'package:yadlo/features/auth/presentation/widgets/login_methodes.dart';
import 'package:yadlo/features/auth/presentation/widgets/validator.dart';

import '../../../../core/textForm/custom_textform.dart';
import '../../../posts/presentation/pages/add_review.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool opsCureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .050,
            child: AppThemeData(),
          ),
          SafeArea(
            left: false,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    alignment: Alignment.topLeft,
                    child: CustomStyle24(text:'Welcome back',family:'Somar Sans' ,color: Color(0xFF0B1A51),fontWeight: FontWeight.w700, ),
                  ),
                  verticalSpace(40),
                  Form(
                      child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: TextForm(
                          textEditingController: _emailController,
                          textHint: 'Email* ',
                          icon: const Icon(Icons.mail_outline),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        margin:
                            EdgeInsets.only(top: 20.h),
                        child: TextForm(
                          opsCureText: opsCureText,
                          textHint: 'Password* ',
                          icon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  opsCureText = !opsCureText;
                                });
                              },
                              child: Icon(opsCureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),
                          textEditingController: _passwordController,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgetPassword()));
                        },
                        child: const Text(
                          'Forgot password ?',
                          style: TextStyle(
                            color: Color(0xFF0B1A51),
                            fontSize: 10,
                            fontFamily: 'Somar Sans',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(20),
                  GeneralButton1(
                      colors: ig3,
                      text: 'Login',
                      width: 180.w,
                      onTap: () {
                        Validator();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddReview()));
                      }),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3.2,
                  ),
                  const Center(child: CustomDivider()),
                  verticalSpace(30),
                  const CustomStyle24(
                    text: 'Login',
                    fontWeight: FontWeight.w700,
                    family: 'Somar Sans',
                    color: Color(0xFF0B1A51),
                  ),
                  const StyleFont14(
                    text: "Log in with one of the following options",
                    fontWeight: FontWeight.w400,
                    family: 'Somar Sans',
                    color: Color(0x9B0B1A51),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3.2,
                  ),
                  const LoginMethods(),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const StyleFont14(
                        text: "Don't have an account",
                        fontWeight: FontWeight.w400,
                        family: 'Somar Sans',
                      ),
                      horizontalSpace(10),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                          },
                          child: const StyleFont14(
                            text: 'Create account',
                            fontWeight: FontWeight.w700,
                            family: 'Somar Sans',
                            decoration: TextDecoration.underline,
                            color: Color(0xFF0B1A51),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
