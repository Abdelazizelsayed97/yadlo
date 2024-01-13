import 'package:flutter/material.dart';

List<Color> Splash = [
  Color(0xFF131C2D),
  Color(0xFF131C2D),
  Color(0xFF162034),
  Color(0xFF222C49),
  Color(0xFF34406A),
  Color(0xFF4D5C99),
  Color(0xFF6C7FD5),
  Color(0xFF8095F9)
];

// ===================================

// Indicator

List<Color> ig1 = [
  Color(0xFF131C2D),
  Color(0xFF131C2D),
  Color(0xFF162034),
  Color(0xFF172135),
  Color(0xFF222C49),
  Color(0xFF34406A),
  Color(0xFF4D5C99),
  Color(0xFF6C7FD5),
  Color(0xFF8095F9)
];
List<Color> ig2 = [
  Color(0xFF8095F9),
  Color(0x00F878),
];
List<Color> ig3 = [
  Color(0xFFD578FF),
  Color(0xFFC37DFD),
  Color(0xFFA687FB),
  Color(0xFF918FFA),
  Color(0xFF8493F9),
  Color(0xFF8095F9),
];
List igClolors = [ig1, ig2, ig3];

// =================================================

List<Color> bgc = [
  Color(0xff131C2D),
  Color(0xff141D2F),
  Color(0xff182136),
  Color(0xff1E2943),
  Color(0xff283355),
  Color(0xff34416C),
  Color(0xff445289),
  Color(0xff5667AB),
  Color(0xff6B7ED2),
  Color(0xff8095F9),
  Color(0xff8095F9)
];
// =================================
List<Color> them = [
  Color(0xffD578FF),
  Color(0xffC37DFD),
  Color(0xffA687FB),
  Color(0xff918FFA),
  Color(0xff8493F9),
  Color(0xff8095F9)
];

List<Color> login1 = [
  Color(0xff00F878),
  Color(0xff0CEE84),
  Color(0xff2DD4A5),
  Color(0xff62ABDB),
  Color(0xff8095F9)
];
List<Color> white = [
  Color(0xffFFFFFF),
  Color(0xffFFFFFF),
  Color(0xffFFFFFF),
];
List<Color> apptheme = [
  Color(0xffD578FF),
  Color(0xffC37DFD),
  Color(0xffA687FB),
  Color(0xff918FFA),
  Color(0xff8493F9),
  Color(0xff8095F9),
];

class AppThemeData extends StatelessWidget {
  const AppThemeData({super.key});





  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: apptheme,
              begin: Alignment.topCenter,
              end: Alignment.topCenter)),

    );
  }
}

class ColorsManger {
  static Color lowGrey = const Color(0Xff4051AD29);
}
