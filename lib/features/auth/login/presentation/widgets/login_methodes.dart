import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_button.dart';

class LoginMethods extends StatelessWidget {
  const LoginMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          image: 'assets/images/Facebook5.svg',
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: CustomIconButton(
            image: 'assets/images/Apple5.svg',
          ),
        ),
        CustomIconButton(
          image: 'assets/images/Google5.svg',
        ),
      ],
    );
  }
}
