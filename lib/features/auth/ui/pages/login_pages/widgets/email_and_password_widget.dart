import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/core/helper/app_regex.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/textForm/custom_textform.dart';
import '../login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;

  const EmailAndPassword({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final formKey = GlobalKey<FormState>();
  bool opsCureText = true;

  late TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            TextForm(
              controller: widget.email,
              textHint: 'Email* ',
              icon: const Icon(Icons.mail_outline),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
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
                      : Icons.visibility_outlined,color: ColorsManger.lowGrey,)),
              controller: widget.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return " Wrong Password ";
                }
              },
            ),
          ],
        ));
  }
}
