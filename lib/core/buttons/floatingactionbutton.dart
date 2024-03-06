import 'package:flutter/material.dart';

class FlaotingActionButton extends StatelessWidget {
  const FlaotingActionButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffD578FF),
        elevation: 0,
        onPressed: onTap,
        child: const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
          size: 40,
        ));
  }
}
