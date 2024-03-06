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
import 'package:yadlo/core/helper/spacing.dart';

import '../../../domain/entities/send_code_entites.dart';
import 'send_code_cubit.dart';
import 'widgets/otp.dart';
import 'widgets/send_code_listener.dart';

enum PageUseCases { RegistrationPage, ResetPassword }

class AuthPage extends StatelessWidget {
  final String email;
  final String code;
  final PageUseCases useCase;

  const AuthPage({
    super.key,
    required this.email,
    required this.code,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendCodeCubit(getIt(),getIt(),getIt()),
      // ..validateReceivedCode(email, code),
      // ..emitSendCodeStates(input: SendCodeInput(email: email)),
      child: _Otp(email: email, useCase: useCase,),
    );
  }

  void sendCodeV(BuildContext context) {
    print('aaaaaaa');
    context.read<SendCodeCubit>().emitSendCodeStates(
        input: SendCodeInput(
            email: email,
            useCase: useCase == PageUseCases.RegistrationPage
                ? SendCodeTypeEnum.EMAIL_VERIFICATION
                : SendCodeTypeEnum.PASSWORD_RESET));
  }

}

class _Otp extends StatefulWidget {
  const _Otp({ required this.email, required this.useCase});

  final String email;
  final PageUseCases useCase;


  @override
  State<_Otp> createState() => _OtpState();
}

class _OtpState extends State<_Otp> {
  final TextEditingController _controller = TextEditingController();

  _OtpState();

  @override
  void initState() {
    super.initState();
    sendCodeV(context);
  }


  @override
  Widget build(BuildContext context) {
    return SendCodeListener(
      email: widget.email,
      useCase: widget.useCase,
      child: Scaffold(
        body: Stack(
          children: [
            const AppThemeData(),
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
                        child: Text(
                          "Authenticate your account",
                          style: Styles.bold(fontSize: 18),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 220.w,
                        child: Text(
                          'Please enter the 4-digit OTP code send to your Email osa******@gmail.com',
                          style: Styles.light(fontSize: 12),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 200.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        verticalSpace(25),
                        OTPVerify(email: widget.email, useCase: widget
                            .useCase,),
                        verticalSpace(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive a code?",
                              style: Styles.light(fontSize: 12),
                            ),
                            BlocListener<SendCodeCubit, SendCodeState>(
                              listener: (context, state) {
                                // if (state is SendCodeInitial) {
                                //   sendCodeV(context);
                                // } if (state is SendCodeSuccess) {
                                //   sendCodeVV(context);
                                // }


                                // TODO: implement listener
                              },
                              child: InkWell(
                                  onTap: () {
                                    sendCodeV(context);
                                  },
                                  child: Text(
                                    '  Resend',
                                    style: Styles.meduim(),
                                  )),
                            )
                          ],
                        ),
                        verticalSpace(15),
                        Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 70),
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
      ),
    );
  }


  void sendCodeV(BuildContext context) {
    print('aaaaaaa');
    context.read<SendCodeCubit>().emitSendCodeStates(
        input: SendCodeInput(
            email: widget.email,
            useCase: widget.useCase == PageUseCases.RegistrationPage
                ? SendCodeTypeEnum.EMAIL_VERIFICATION
                : SendCodeTypeEnum.PASSWORD_RESET));
  }

// void sendCodeVV(BuildContext context) {
//   context.read<SendCodeCubit>().emitResetSendCodeStates(
//       input: SendCodeInput(
//           email: widget.email, useCase: SendCodeUseCases.PASSWORD_RESET));
// }
}
