import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/app_regex.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';
import 'package:yadlo/features/auth/ui/cubit/send_code_cubit/send_code_cubit.dart';
import 'package:yadlo/features/auth/ui/pages/auth_accout.dart';

import '../../../domain/entities/send_code_entites.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendCodeCubit>(
      create: (context) => SendCodeCubit(getIt(), getIt(),getIt()),
      child: const ForgetPassword(),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // sendCodeVV(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendCodeCubit, SendCodeState>(
      listener: (context, state) {
        if(state is SendCodeLoading){
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(ColorsManger.primary),
                color: ColorsManger.primary,
              ),
            ),
          );
        }
        if (state is SendCodeSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  AuthPage(email: _controller.text, code: '',useCase: PageUseCases.ResetPassword,)));
        }
        if(state is SendCodeFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

      },
      child: Scaffold(
        body: Stack(
          children: [
            const AppThemeData(),
            Positioned(
              left: 0,
              right: 0,
              top: SizeConfig.defaultSize! * 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/passlogo.svg",
                    height: 95.h,
                    width: 95.w,
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30.h),
                      width: 190.w,
                      child: Text(
                        'Forgot Password',
                        style: Styles.semiBlod(fontSize: 22,color: Colors.black),
                      )),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 23.h),
                      width: 220.w,
                      child: Text(
                        strutStyle:StrutStyle(height: 1,forceStrutHeight: true,) ,softWrap: true,textAlign: TextAlign.center,
                        "Enter your Email that you registered with and we will send you a code to verify and reset your password",
                        style: Styles.normal(fontSize: 12,),
                      )),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 38.h),
                    height: 190.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.h),
                            child: TextForm(
                              label: 'Email',
                              controller: _controller,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !AppRegex.isEmailValid(value)) {
                                  return "Enter a valid Email";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          verticalSpace(20),
                          GeneralButton2(
                            onTap: () {
                              sendCodeVV(context);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => AuthPage(email: _controller.text, code: "")));
                            },
                            colors: them,
                            child:
                                Text('Send', style: Styles.bold(fontSize: 16,color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendCodeVV(BuildContext context) {
    context.read<SendCodeCubit>().emitResetSendCodeStates(
        input: SendCodeInput(
            email: _controller.text, useCase: SendCodeUseCases.PASSWORD_RESET));
  }
}
