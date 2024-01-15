import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_state.dart';
import 'package:yadlo/features/auth/data/graph_ql/graph_ql_request.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/presentation/pages/forget_password.dart';
import 'package:yadlo/features/auth/presentation/pages/registration_page.dart';
import 'package:yadlo/features/auth/presentation/widgets/divider.dart';
import 'package:yadlo/features/auth/presentation/widgets/email_and_password_widget.dart';
import 'package:yadlo/features/auth/presentation/widgets/login_methodes.dart';
import 'package:yadlo/features/auth/presentation/widgets/validator.dart';

import '../../../posts/presentation/pages/add_review.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Opacity(
            opacity: .050,
            child: AppThemeData(),
          ),
          SafeArea(
            left: false,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40.h,
                      alignment: Alignment.topLeft,
                      child: const CustomStyle24(
                        text: 'Welcome back',
                        family: 'Somar Sans',
                        color: Color(0xFF0B1A51),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    verticalSpace(40),
                    EmailAndPassword(),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  const ForgetPassword()));
                            },
                            child: const StyleFont10(
                              text: 'Forgot password ?',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Somar Sans',
                            )),
                      ],
                    ),
                    verticalSpace(20),
                    GeneralButton1(
                        colors: ig3,
                        text: 'Login',
                        width: 180.w,
                        onTap: () {
                          ValidateToHome(context);

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const AddReview()));
                        }),
                    verticalSpace(30),
                    const Center(child: CustomDivider()),
                    verticalSpace(30),
                    const CustomStyle24(
                      text: 'Login',
                      fontWeight: FontWeight.w700,
                      family: 'Somar Sans',
                      color: Color(0xFF0B1A51),
                    ),
                    verticalSpace(5),
                    const StyleFont14(
                      text: "Log in with one of the following options",
                      fontWeight: FontWeight.w400,
                      family: 'Somar Sans',
                      color: Color(0x9B0B1A51),
                    ),
                    verticalSpace(30),
                    const LoginMethods(),
                    verticalSpace(37),
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
          ),
        ],
      ),
    );
  }

  void ValidateToHome(BuildContext context) {
    if (context
        .read<LoginCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<LoginCubit>().login(

        LoginInput(email:context.read<LoginCubit>().emailController.text ,password: context.read<LoginCubit>().passwordController.text , )
      );
    }
  }
}
