import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Sizeable/commonSizes.dart';


class GeneralButton1 extends StatelessWidget {
    const GeneralButton1({Key? key, this.text, this.onTap, this.color,   this.width, this.colors, this.textColor,  })
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final List<Color>?  colors;
  final width;
  final color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: 50.h,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:color,
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft, colors:colors?? [Colors.white,Colors.white],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text!,
            style:  TextStyle(
              color:textColor ?? Colors.white,
              fontSize: 16,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }}


class GeneralButton2 extends StatelessWidget {
   const GeneralButton2({Key? key,  this.onTap, this.color,  required this.colors, this.width, this.child,   })
      : super(key: key);
  final child;
  final VoidCallback? onTap;
  final List<Color>  colors;
  final  width;
  final  color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: SizeConfig.defaultSize!*4.9,
        width: width,alignment: Alignment.center,
        decoration: BoxDecoration(
          color:color,
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft, colors: colors
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: child
        ),
      ),
    );
  }}