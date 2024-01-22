import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../cache/colors/colors.dart';
import '../../../../../core/buttons/general_button.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({super.key, this.image});

  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        width: 50.w,
        child: GeneralButton2(
          colors: white,
          width: 50.0.w,

          child: SvgPicture.asset(
            image,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            fit: BoxFit.cover,
          ),
        ));
  }
}
