import 'package:flutter/material.dart';
import '../../../../core/boarding_assets.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({
    super.key,
    required this.currentValue, // Receive currentValue
  });

  final int currentValue;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardPages.length, // Use the length of your onboardPages list
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 150),
            width: index == widget.currentValue ? 28 : 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}