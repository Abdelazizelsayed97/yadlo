import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/domain/entities/login_entites/login_input.dart';
import 'package:yadlo/features/auth/ui/pages/divider.dart';
import 'package:yadlo/features/auth/ui/pages/register/registration_page.dart';
import 'package:yadlo/features/auth/ui/pages/login_pages/widgets/login_methodes.dart';

import '../../../../../cache/themData/them_data.dart';
import 'login_cubit.dart';
import 'login_state.dart';
import '../forget_password/forget_password.dart';
import 'widgets/email_and_password_widget.dart';
import 'widgets/login_bloc_listener.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt(),
      ),
      child: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoginBlocListener(
      child: Scaffold(
        body: Stack(
          children: [
            const AppThemeData(),
            SafeArea(
              left: false,
              child: Padding(
                padding: EdgeInsets.all(25.0.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 40.h,
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Welcome back',
                            style: Styles.bold(
                                fontSize: 24, color: const Color(0xFF0B1A51)),
                          )),
                      verticalSpace(40),
                      EmailAndPassword(
                        email: _email,
                        password: _password,
                      ),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPassword()));
                              },
                              child: Text(
                                'Forgot password ?',
                                style: Styles.normal(fontSize: 10),
                              )),
                        ],
                      ),
                      verticalSpace(20),
                      GeneralButton1(
                          colors: gradientPrimyColors,
                          text: 'Login',
                          width: 180.w,
                          onTap: () {
                            login(context);
                            Center(
                              child: BlocBuilder<LoginCubit, LoginState>(
                                  buildWhen: (previous, current) =>
                                      current is LoadingState,
                                  builder: (context, state) {
                                    return CircularProgressIndicator(
                                      color: ColorsManger.primary,
                                    );
                                  }),
                            );
                          }),
                      verticalSpace(30),
                      const Center(child: CustomDivider()),
                      verticalSpace(30),
                      Text(
                        'Login',
                        style:
                            Styles.bold(fontSize: 24, color: const Color(0xFF0B1A51)),
                      ),
                      verticalSpace(5),
                      Text(
                        "Log in with one of the following options",
                        style: Styles.normal(
                          color: const Color(0x9B0B1A51),
                        ),
                      ),
                      verticalSpace(30),
                      const LoginMethods(),
                      verticalSpace(37),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account",
                              style: Styles.normal(fontSize: 14)),
                          horizontalSpace(10),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()));
                              },
                              child: Text(
                                'Create account',
                                style: Styles.bold(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
              input: LoginInput(
            email: _email.text,
            password: _password.text,
          ));
    }
  }
}
