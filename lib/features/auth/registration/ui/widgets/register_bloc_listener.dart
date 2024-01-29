import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_state.dart';
import 'package:yadlo/features/auth/registration/ui/Pages/auth_accout.dart';

import '../../../../../cache/colors/colors.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({
    super.key,
    required this.child,
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
                color: ColorsManger.primary,
              ),
            ),
          );
        }
        if (state is RegSuccessState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Otp()));
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
}
