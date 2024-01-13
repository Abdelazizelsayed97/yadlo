import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.onTap, this.style, this.text});
  final onTap ;
  final style;
  final text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Text(
        text,
        style: style
      ),
    );
  }
}
