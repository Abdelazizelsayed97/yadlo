import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_cubit.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/textForm/custom_textform.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  // final formKey = GlobalKey<FormState>();
  bool opsCureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      passwordController = context.read<LoginCubit>().passwordController;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            TextForm(
              controller: context.read<LoginCubit>().emailController,
              textHint: 'Email* ',
              icon: const Icon(Icons.mail_outline),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a valid Email";
                }
              },
            ),
            verticalSpace(20.h),
            TextForm(
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
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return " Wrong Password " ;
                }
              },
            ),
          ],
        ));
  }
}
