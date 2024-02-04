import 'package:flutter/material.dart';

class CustomStyle12 extends StatelessWidget {
  const CustomStyle12(
      {super.key, required this.text, this.fontWeight, this.fontFamily});

  final FontWeight? fontWeight;
  final String text;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
      style: TextStyle(
        color: const Color(0xFF2A3838),
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w300,
        height: 0.12,
      ),
    );
  }
}

class CustomStyle22 extends StatelessWidget {
  const CustomStyle22({super.key, required this.text, this.fontWeight});

  final FontWeight? fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
        color: const Color(0xFF2A3838),
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 0.05,
      ),
    );
  }
}

class CustomStyle24 extends StatelessWidget {
  const CustomStyle24(
      {super.key,
      required this.text,
      this.fontWeight,
      this.family,
      this.color});

  final FontWeight? fontWeight;
  final String text;
  final String? family;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
        color: color ?? const Color(0xFF2A3838),
        fontSize: 24,
        fontFamily: family ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 0.05,
      ),
    );
  }
}

class CustomStyle18 extends StatelessWidget {
  const CustomStyle18({super.key, required this.text, this.fontWeight});

  final FontWeight? fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF2A3838),
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w700,
        height: 0,
      ),
    );
  }
}

class StyleFont14 extends StatelessWidget {
  const StyleFont14(
      {super.key,
      required this.text,
      this.fontWeight,
      this.family,
      this.decoration,
      this.color});

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final String? family;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
          color: color ?? const Color(0xFF374053),
          fontSize: 14,
          fontFamily: family ?? 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 0,
          decoration: decoration),
    );
  }
}

class StyleFont13 extends StatelessWidget {
  const StyleFont13(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontFamily});

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
        color: color ?? const Color(0xFF374053),
        fontSize: 13,
        fontFamily: fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,
      ),
    );
  }
}

class StyleFont20 extends StatelessWidget {
  const StyleFont20(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontFamily});

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
        color: color ?? const Color(0xFF374053),
        fontSize: 20,
        fontFamily: fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,
      ),
    );
  }
}

class StyleFont10 extends StatelessWidget {
  const StyleFont10(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontFamily,
      this.decoration});

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style: TextStyle(
          color: color ?? const Color(0xFF374053),
          fontSize: 10,
          fontFamily: fontFamily ?? 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 0,
          decoration: decoration),
    );
  }
}




TextStyle customizeTextStyle({
  String? fontFamily,
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  FontStyle? fontStyle,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
    fontStyle: fontStyle,
    decoration: decoration,
  );
}

TextStyle bold24 = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 24);
TextStyle bold18 = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 18);
TextStyle bold20 = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 20);
TextStyle bold22 = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 22);
TextStyle bold16 = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 16,fontFamily: 'Somar Sans');
TextStyle bold14underLine = customizeTextStyle(fontWeight:FontWeight.w700,fontSize: 14,fontFamily: 'Somar Sans',decoration: TextDecoration.underline);


TextStyle normal14 = customizeTextStyle(fontWeight:FontWeight.w400,fontSize: 14,fontFamily:'Somar Sans');
TextStyle normal16 = customizeTextStyle(color:Colors.white,fontWeight:FontWeight.w400,fontSize: 16,fontFamily:'Somar Sans' );
TextStyle normal13 = customizeTextStyle(fontWeight:FontWeight.w400,fontSize: 13);
TextStyle normal26white = customizeTextStyle(fontWeight:FontWeight.w400,fontSize: 26,color: Colors.white);
TextStyle normal15white = customizeTextStyle(fontWeight:FontWeight.w400,fontSize: 15,color: Colors.white);
TextStyle normal10 = customizeTextStyle(fontWeight:FontWeight.w400,fontSize: 10,fontFamily:'Somar Sans',decoration: TextDecoration.underline );


// Example of usage:
// TextStyle myTextStyle = customizeTextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blue);


  // class TextStyles {
  //   TextStyles._();
  //
  //   static const TextStyle font24Bold = TextStyle(
  //     fontSize: 24,
  //     fontWeight: FontWeight.bold,
  //   );
  //
  //   static const TextStyle font16SemiBold = TextStyle(
  //     fontSize: 16,
  //     color: Colors.black,
  //     fontWeight: FontWeight.w500
  //   );
  // static  Bold(fontFamily,double fontSize, { required String fontFamily, required double fontSize}){
  //   Bold. _();
  //   TextStyle(
  //     fontWeight: FontWeight.w700,
  //     color: Colors.black,
  //     fontFamily: fontFamily?? 'somar san',
  //       fontSize: fontSize,
  //   );
  // }
  //   TextStyle myBoldTextStyle = TextStyles.Bold(fontFamily:'yourFontFamily', fontSize: 20.0);
  //
  // }
