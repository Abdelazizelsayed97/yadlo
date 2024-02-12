import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/send_code_cubit/send_code_cubit.dart';
import '../../pages/auth_accout.dart';

class SendCodeListener extends StatelessWidget {
  const SendCodeListener(
      {super.key,
      required this.child,
      required this.email,
      required this.useCase});

  final Widget child;
  final String email;
  final PageUseCases useCase;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendCodeCubit, SendCodeState>(
      listener: (context, state) async {
        if (state is SendCodeInitial) {
          // sendCodeV(context);
        }
        if (state is SendCodeSuccess) {
          print(' code sent successfully');
        }

        if (state is SendCodeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: child,
    );
  }
}
