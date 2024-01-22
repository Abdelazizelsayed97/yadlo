import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ThemeDataApp  extends StatelessWidget{
  late ThemeDataApp themeData;

  ThemeDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: apptheme,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
    );
  }
}
class TestTheme{
  ThemeData themeData = ThemeData();
  List them = apptheme;

}


// Create a theme data object
final ThemeData myTheme = _buildMyTheme();

ThemeData _buildMyTheme() {
  return ThemeData(
    primaryColor: Colors.deepOrange,
    hintColor: Colors.green,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
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
                colors: apptheme,
                begin: Alignment.topCenter,
                end: Alignment.topCenter)),

      ),
    );
  }
}