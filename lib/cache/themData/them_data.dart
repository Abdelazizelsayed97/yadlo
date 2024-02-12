import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ThemeDataApp  extends StatelessWidget{
  late ThemeDataApp themeData;

  ThemeDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Opacity(
      opacity: 0.050,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: appTheme,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}
class TestTheme{
  ThemeData themeData = ThemeData();
  List them = appTheme;

}


// Create a theme data object
final ThemeData myTheme = _buildMyTheme();

ThemeData _buildMyTheme() {
  return ThemeData(
    primaryColor: Colors.deepOrange,
    hintColor: Colors.green,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
class AppThemeData extends StatelessWidget {
  const AppThemeData({super.key});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .050,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: appTheme,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),

      ),
    );
  }
}