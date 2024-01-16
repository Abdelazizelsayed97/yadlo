import 'package:flutter/material.dart';

class CustomStyle12 extends StatelessWidget {
  const CustomStyle12({super.key, required this.text, this.fontWeight, this.fontFamily});
  final FontWeight? fontWeight;
  final String text;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      strutStyle: const StrutStyle(height: 1,forceStrutHeight: true),
      style:  TextStyle(
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
        fontWeight:fontWeight ?? FontWeight.w600,
        height: 0.05,
      ),
    );
  }
}
class CustomStyle24 extends StatelessWidget {
  const CustomStyle24({super.key, required this.text, this.fontWeight, this.family, this.color});
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
        color:color?? const Color(0xFF2A3838),
        fontSize: 24,
        fontFamily:family?? 'Poppins',
        fontWeight:fontWeight ?? FontWeight.w600,
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
      style:  TextStyle(
        color: const Color(0xFF2A3838),
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight:fontWeight ?? FontWeight.w700,
        height: 0,
      ),
    );
  }
}
class StyleFont14 extends StatelessWidget {
   const StyleFont14({super.key, required this.text, this.fontWeight, this.family, this.decoration, this.color});
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
      style:  TextStyle(
        color: color ??const Color(0xFF374053),
        fontSize: 14,
        fontFamily: family??'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,
        decoration:decoration
      ),
    );
  }
}
class StyleFont13 extends StatelessWidget {
   const StyleFont13({super.key, required this.text, this.fontWeight, this.color, this.fontFamily});
final String text;
final FontWeight? fontWeight;
final Color? color;
final String?fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,strutStyle: const StrutStyle(forceStrutHeight: true),
      style:  TextStyle(
        color: color?? const Color(0xFF374053),
        fontSize: 13,
        fontFamily:fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,

      ),
    );
  }
}class StyleFont20 extends StatelessWidget {
   const StyleFont20({super.key, required this.text, this.fontWeight, this.color, this.fontFamily});
final String text;
final FontWeight? fontWeight;
final Color? color;
final String?fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style:  TextStyle(
        color: color?? const Color(0xFF374053),
        fontSize: 20,
        fontFamily:fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,
      ),
    );
  }
}class StyleFont10 extends StatelessWidget {
   const StyleFont10({super.key, required this.text, this.fontWeight, this.color, this.fontFamily, this.decoration});
final String text;
final FontWeight? fontWeight;
final Color? color;
final String?fontFamily;
final TextDecoration? decoration ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      strutStyle: const StrutStyle(forceStrutHeight: true),
      style:  TextStyle(
        color: color?? const Color(0xFF374053),
        fontSize: 10,
        fontFamily:fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 0,decoration: decoration
      ),
    );
  }
}

