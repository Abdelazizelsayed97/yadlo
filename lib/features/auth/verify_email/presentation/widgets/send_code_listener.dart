import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/cubit-auth/send_code_cubit/send_code_cubit.dart';

class SendCodeListener extends StatelessWidget {
  const SendCodeListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendCodeCubit, SendCodeState>(
      listener: (context, state) async {
        if (state is SendCodeInitial) {}
        if (state is SendCodeSuccess) {
           // const AlertDialog(alignment: Alignment.topCenter,
           //   shape:OutlineInputBorder(borderSide: BorderSide(width: 100,strokeAlign: 20,
           //       color: Colors.greenAccent)) ,backgroundColor: Colors.green,icon: Icon(Icons.check),);
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
