import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/ui/pages/register/register_state.dart';

import '../../../../../../cache/colors/colors.dart';
import '../../verify/auth_accout.dart';
import '../register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  final String email;

  const RegisterBlocListener({
    super.key,
    required this.child, required this.email,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(ColorsManger.primary),
                color: ColorsManger.primary,
              ),
            ),
          );
        }
        if (state is RegSuccessState) {
          print('emails:$email');
          // sendCodeV(context);
          Navigator.of(context).pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return  AuthPage(email:state.email,code: "",useCase: PageUseCases.RegistrationPage,);
            },
          ));
        }
        if (state is RegFailureState) {
          Navigator.of(context).pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      child: child,
    );
  }
  // void sendCodeV(BuildContext context)  {
  //   print('aaaaaaa');
  //   context
  //       .read<SendCodeCubit>()
  //       .emitSendCodeStates(input: SendCodeInput(email: email, useCase: SendCodeUseCases.EMAIL_VERIFICATION));
  // }

}
