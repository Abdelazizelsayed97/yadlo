import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';
import 'package:yadlo/features/auth/ui/cubit/set_newpss_cubit/set_newpass_cubit.dart';
import 'package:yadlo/features/auth/ui/pages/login_pages/login_page.dart';

import '../../../domain/entities/set_newpass_entities.dart';

class SetNewPass extends StatelessWidget {
  const SetNewPass({super.key, required this.code, required this.email});

  final String code;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetNewPasswordCubit(getIt()),
      child: SetNewPassBody(
        code: code,
        email: email,
      ),
    );
  }
}

class SetNewPassBody extends StatefulWidget {
  SetNewPassBody({super.key, required this.code, required this.email});

  final String code;
  final String email;

  @override
  State<SetNewPassBody> createState() => _SetNewPassBodyState();
}

class _SetNewPassBodyState extends State<SetNewPassBody> {
  bool opsCureText = true;
  bool oOpsCureText = true;

  TextEditingController _comfirmPasswordController = TextEditingController();

  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetNewPasswordCubit, SetNewPasswordState>(
      listener: (context, state) {
        if (state is SetNewPasswordLoading) {
          showDialog(
              context: context,
              builder: (context) {
                return CircularProgressIndicator(
                  color: ColorsManger.primary,
                );
              });
        }
        if (state is SetNewPasswordSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        if (state is SetNewPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      child: Scaffold(
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
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19)),
                      height: 300.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter New Password',
                                  style: TextStyle(
                                    color: Color(0xFF3E4B4B),
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.25,
                                  ),
                                ),
                              ),
                              verticalSpace(10),
                              TextForm(
                                textHint: 'Set new password',
                                opsCureText: opsCureText,
                                controller: _passWordController,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        opsCureText = !opsCureText;
                                      });
                                    },
                                    child: Icon(opsCureText
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                                validator: (value) {},
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Confirm New Password',
                                  style: TextStyle(
                                    color: Color(0xFF3E4B4B),
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.25,
                                  ),
                                ),
                              ),
                              verticalSpace(10),
                              TextForm(
                                textHint: 'Set new password',
                                opsCureText: oOpsCureText,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        oOpsCureText = !oOpsCureText;
                                      });
                                    },
                                    child: Icon(oOpsCureText
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                                controller: _comfirmPasswordController,
                                validator: (value) {
                                  if (_comfirmPasswordController ==
                                      _passWordController) {
                                    return const Text('confirm password');
                                  } else {
                                    const Text('Password Must Be Same');
                                  }
                                },
                              ),
                            ],
                          ),
                          GeneralButton1(
                            colors: ig3,
                            text: 'Send',
                            onTap: () {
                              print(_passWordController);
                              print(_comfirmPasswordController);
                             setState(() {
                               if (_passWordController.value ==
                                   _comfirmPasswordController.value) {
                                 setNewPassword(context);
                               } else {
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                     content: Text('Password Must Be Same')));
                               }
                             });
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  void setNewPassword(BuildContext context) {
    context.read<SetNewPasswordCubit>().setNewPassword(
        input: SetNewPasswordInput(
            email: widget.email,
            code: widget.code,
            password: _passWordController.text));
  }
}
