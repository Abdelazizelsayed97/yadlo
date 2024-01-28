import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/core/errors/error_model.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_state.dart';
import 'package:yadlo/features/auth/login/presentation/pages/auth_accout.dart';

import '../../../../../cache/colors/colors.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(listener: (context, state) {
      if(state is RegLoadingState){
        showDialog(context: context, builder: (context) =>
          Center(
            child: CircularProgressIndicator(
              color: ColorsManger.primary,
            ),
          )

        ,);
      }
      if(state is RegSuccessState){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Otp()));
      }
      if(state is RegFailureState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(ApiErrorModel().message!),
        ));
      }

    },);
  }
}
