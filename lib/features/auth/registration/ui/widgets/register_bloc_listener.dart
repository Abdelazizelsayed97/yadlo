import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_state.dart';

import '../../../../../cache/colors/colors.dart';
import '../Pages/auth_accout.dart';

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
          print('fghjhfgdvghjfhgv');
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
          print('Youseff');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              print('dfghjihgfdfghjkiokjhgfvcghjkiojhgvfcghjkjhbgv');
              return const Otp();
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
}
