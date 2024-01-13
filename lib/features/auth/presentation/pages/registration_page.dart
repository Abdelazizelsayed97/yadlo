import 'package:flutter/material.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/features/auth/presentation/pages/auth_accout.dart';
import 'package:yadlo/features/auth/presentation/pages/login_page.dart';
import 'package:yadlo/features/auth/presentation/widgets/divider.dart';

import '../../../../cache/colors/colors.dart';
import '../../../../core/Sizeable/commonSizes.dart';
import '../../../../core/buttons/general_button.dart';
import '../../../../core/textForm/custom_textform.dart';
import '../widgets/login_methodes.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool value = false;

  late String image = 'assets/images/avatar.png';

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .050,
            child: ThemeDataApp(),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(SizeConfig.defaultSize! * 3),
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.defaultSize! * 4,
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Join Yodly',
                      style: TextStyle(
                        color: Color(0xFF0B1A51),
                        fontSize: 24,
                        fontFamily: 'Somar Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 7,
                    width: SizeConfig.defaultSize! * 7,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/avatar.png',
                      ),
                      child: Image.asset(image),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 4),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: TextForm(textEditingController:_userName ,
                      textHint: 'User name*',
                      icon: const Icon(Icons.mail_outline),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.defaultSize! * 2),
                    child: TextForm(

                      textHint: 'JohnDeo@gmail.com',
                      icon: const Icon(Icons.mail_outline), textEditingController: _emailController,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: TextForm(
                      textHint: 'Password* ',
                      icon: const Icon(Icons.lock_outline), textEditingController: _passwordController,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  const Text(
                    'Privacy policy',
                    style: TextStyle(
                      color: Color(0xFF374053),
                      fontSize: 10,
                      fontFamily: 'Somar Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'By clicking Agree and Register, you agree to ',
                              style: TextStyle(
                                color: Color(0xFF374053),
                                fontSize: 10,
                                fontFamily: 'Somar Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of use',
                              style: TextStyle(
                                color: Color(0xFF374053),
                                fontSize: 10,
                                fontFamily: 'Somar Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: Color(0xFF374053),
                                fontSize: 10,
                                fontFamily: 'Somar Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  GeneralButton1(
                      colors: ig3,
                      text: 'Agree & Register',
                      width: SizeConfig.defaultSize! * 30,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Otp()));
                      }),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3.2,
                  ),
                  const CustomDivider(),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  const Text(
                    'Sign up with one of the following options',
                    style: TextStyle(
                      color: Color(0x9B0B1A51),
                      fontSize: 12,
                      fontFamily: 'Somar Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1.2,
                  ),
                  const LoginMethods(),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Aleardy ave an account',
                        style: TextStyle(
                          color: Color(0xFF0B1A51),
                          fontSize: 14,
                          fontFamily: 'Somar Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  LoginPage()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF0B1A51),
                            fontSize: 14,
                            fontFamily: 'Somar Sans',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                      )
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
