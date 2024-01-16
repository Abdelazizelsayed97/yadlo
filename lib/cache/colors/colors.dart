import 'package:flutter/material.dart';

List<Color> Splash = [
  const Color(0xFF131C2D),
  const Color(0xFF131C2D),
  const Color(0xFF162034),
  const Color(0xFF222C49),
  const Color(0xFF34406A),
  const Color(0xFF4D5C99),
  const Color(0xFF6C7FD5),
  const Color(0xFF8095F9)
];

// ===================================

// Indicator

List<Color> ig1 = [
  const Color(0xFF131C2D),
  const Color(0xFF131C2D),
  const Color(0xFF162034),
  const Color(0xFF172135),
  const Color(0xFF222C49),
  const Color(0xFF34406A),
  const Color(0xFF4D5C99),
  const Color(0xFF6C7FD5),
  const Color(0xFF8095F9)
];
List<Color> ig2 = [
  const Color(0xFF8095F9),
  const Color(0x00F878),
];
List<Color> ig3 = [
  const Color(0xFFD578FF),
  const Color(0xFFC37DFD),
  const Color(0xFFA687FB),
  const Color(0xFF918FFA),
  const Color(0xFF8493F9),
  const Color(0xFF8095F9),
];
List igClolors = [ig1, ig2, ig3];

// =================================================

List<Color> bgc = [
  const Color(0xff131C2D),
  const Color(0xff141D2F),
  const Color(0xff182136),
  const Color(0xff1E2943),
  const Color(0xff283355),
  const Color(0xff34416C),
  const Color(0xff445289),
  const Color(0xff5667AB),
  const Color(0xff6B7ED2),
  const Color(0xff8095F9),
  const Color(0xff8095F9)
];
// =================================
List<Color> them = [
  const Color(0xffD578FF),
  const Color(0xffC37DFD),
  const Color(0xffA687FB),
  const Color(0xff918FFA),
  const Color(0xff8493F9),
  const Color(0xff8095F9)
];

List<Color> login1 = [
  const Color(0xff00F878),
  const Color(0xff0CEE84),
  const Color(0xff2DD4A5),
  const Color(0xff62ABDB),
  const Color(0xff8095F9)
];
List<Color> white = [
  const Color(0xffFFFFFF),
  const Color(0xffFFFFFF),
  const Color(0xffFFFFFF),
];
List<Color> apptheme = [
  const Color(0xffD578FF),
  const Color(0xffC37DFD),
  const Color(0xffA687FB),
  const Color(0xff918FFA),
  const Color(0xff8493F9),
  const Color(0xff8095F9),
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
