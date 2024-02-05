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
import 'package:yadlo/features/auth/ui/cubit/register_cubit/register_state.dart';

import '../../domain/entities/send_code_entites.dart';
import '../cubit/send_code_cubit/send_code_cubit.dart';
import '../widgets/verify_widgets/otp.dart';
import '../widgets/verify_widgets/send_code_listener.dart';

class AuthPage extends StatelessWidget {
  final String email;
  final String code;

  const AuthPage({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendCodeCubit(getIt(), getIt()),
      // ..validateReceivedCode(email, code),
      // ..emitSendCodeStates(input: SendCodeInput(email: email)),
      child: _Otp(email: email),
    );
  }

  void sendCodeV(BuildContext context) {
    print('aaaaaaa');
    context.read<SendCodeCubit>().emitSendCodeStates(
        input: SendCodeInput(
            email: email, useCase: SendCodeUseCases.EMAIL_VERIFICATION));
  }
}

class _Otp extends StatefulWidget {
  const _Otp({required this.email});

  final String email;

  @override
  State<_Otp> createState() => _OtpState();
}

class _OtpState extends State<_Otp> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Column(children: [
                      verticalSpace(25),
                      OTPVerify(email: widget.email),
                      verticalSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomStyle12(text: "Didn't receive a code?"),
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
                                  final result = SendCodeInput(email: widget.email,).useCase;

                                  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${result?.useCase} ' );

                                  if (useCase == SendCodeUseCases.EMAIL_VERIFICATION) {
                                    sendCodeV(context);
                                  } else if (useCase == SendCodeUseCases.PASSWORD_RESET) {
                                    sendCodeVV(context);
                                  }


                                  // print('email  ${widget.email}');
                                  // final result =
                                  //     SendCodeInput(email: widget.email)
                                  //         .useCase ==
                                  //         SendCodeUseCases.EMAIL_VERIFICATION;
                                  // final respone =
                                  //     SendCodeInput(email: widget.email)
                                  //             .useCase ==
                                  //         SendCodeUseCases.PASSWORD_RESET;
                                  //
                                  // print('inkwell   $result');
                                  // print('$respone');
                                  // if (result == false) {
                                  //   print(
                                  //       '@@@@@    ${SendCodeInput(email: widget.email).useCase == SendCodeUseCases.EMAIL_VERIFICATION}');
                                  //    sendCodeV(context);
                                  // } else if (respone == true) {
                                  //
                                  //   sendCodeVV(context);
                                  // }
                                  // switch (result) {
                                  // // case SendCodeUseCases.EMAIL_VERIFICATION:
                                  // // // do something
                                  // //   return sendCodeV(context);
                                  // // case SendCodeUseCases.PASSWORD_RESET:
                                  // // // do something else
                                  // //   return sendCodeVV(context);
                                  //   case true:
                                  //   // TODO: Handle this case.
                                  //     return sendCodeVV(context);
                                  //   case false:
                                  //   // TODO: Handle this case.
                                  //     return sendCodeV(context);
                                  // }

                                },
                                child: const StyleFont14(
                                  text: '  Resend',
                                  fontWeight: FontWeight.w500,
                                )),
                          )
                        ],
                      ),
                      verticalSpace(15),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 70),
                        child: SendCodeListener(
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

  void sendCodeV(BuildContext context) {
    print('aaaaaaa');
    context.read<SendCodeCubit>().emitSendCodeStates(
        input: SendCodeInput(
            email: widget.email, useCase: SendCodeUseCases.EMAIL_VERIFICATION));
  }

  void sendCodeVV(BuildContext context) {
    context.read<SendCodeCubit>().emitResetSendCodeStates(
        input: SendCodeInput(
            email: widget.email, useCase: SendCodeUseCases.PASSWORD_RESET));
  }
}
