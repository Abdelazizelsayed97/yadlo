import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/features/auth/ui/pages/login_pages/widgets/icon_button.dart';


class LoginMethods extends StatelessWidget {
  const LoginMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIconButton(
          image: 'assets/images/Facebook5.svg',
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: const CustomIconButton(
            image: 'assets/images/Apple5.svg',
          ),
        ),
        const CustomIconButton(
          image: 'assets/images/Google5.svg',
        ),
      ],
    );
  }
}
