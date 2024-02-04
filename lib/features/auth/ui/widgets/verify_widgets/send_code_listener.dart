
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

import '../../cubit/send_code_cubit/send_code_cubit.dart';

class SendCodeListener extends StatelessWidget {
  const SendCodeListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return BlocListener<SendCodeCubit, SendCodeState>(
      listener: (context, state) async {
        if (state is SendCodeInitial) {}
        if (state is SendCodeSuccess) {

        }
        if(state is VerifySuccess){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const TimeLinePage()));

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
