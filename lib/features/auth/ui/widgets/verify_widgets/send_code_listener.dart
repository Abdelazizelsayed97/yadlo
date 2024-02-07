import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/domain/entities/send_code_entites.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

import '../../cubit/send_code_cubit/send_code_cubit.dart';
import '../../pages/auth_accout.dart';
class SendCodeListener extends StatelessWidget {
  const SendCodeListener({super.key, required this.child, required this.email, required this.useCase});

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
        if (state is SendCodeSuccess) {}
        if (state is VerifySuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const TimeLinePage()));
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
//   void sendCodeV(BuildContext context) {
//     print('aaaaaaa');
//     context.read<SendCodeCubit>().emitSendCodeStates(
//         input: SendCodeInput(
//             email: email,
//             useCase: useCase == PageUseCases.RegistrationPage
//                 ? SendCodeUseCases.EMAIL_VERIFICATION
//                 : SendCodeUseCases.PASSWORD_RESET));
//   }
}
