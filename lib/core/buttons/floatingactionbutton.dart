import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:yadlo/features/auth/domain/usecases/login_usecase.dart';
import 'package:yadlo/features/auth/presentation/pages/login_registration.dart';

class FlaotingActionButton extends StatelessWidget {
  const FlaotingActionButton({super.key, required this.onTap,});
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffD578FF),
        elevation: 0,
        onPressed:onTap,
        child: const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
          size: 40,
        ));
  }
}
