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
    // Define the primary color
    primaryColor: Colors.deepOrange,

    // Define the accent color
    hintColor: Colors.green,

    // Define the theme font
    fontFamily: 'Montserrat',

    // Define the text theme
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}