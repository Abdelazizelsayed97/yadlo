import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Sizeable/commonSizes.dart';


class GeneralButton1 extends StatelessWidget {
     GeneralButton1({super.key, this.text, this.onTap, this.color,   this.width, this.colors, this.textColor,  });
  final String? text;
  final VoidCallback? onTap;
  final List<Color>?  colors;
  final width;
  final color;
  final Color? textColor;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isOn ?null: onTap,
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
   const GeneralButton2({super.key,  this.onTap, this.color,  required this.colors, this.width, this.child,   });
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = true;
  }

  void _incrementCounter() {
    setState(() {
      _isButtonDisabled = false;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
            _buildCounterButton(),
          ],
        ));

  }

  Widget _buildCounterButton() {
    return ElevatedButton(
      child: Text(
          _isButtonDisabled ? "Hold on..." : "Increment"
      ),
      onPressed: _isButtonDisabled ? null : _incrementCounter,
    );
  }
}