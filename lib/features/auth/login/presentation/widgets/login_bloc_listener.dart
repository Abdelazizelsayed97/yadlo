import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_state.dart';
import 'package:yadlo/features/auth/login/data/model/login_model.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

class LoginBlocListener extends StatelessWidget {
  LoginBlocListener({super.key, this.child, });

  final child;
  final ApiEmailAndPasswordLogin _apiEmailAndPasswordLogin = ApiEmailAndPasswordLogin();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      // listenWhen: (previous, current) =>
      //     current is LoadingState || current is SuccessState,
        listener: (context, state) {
          if (state is LoadingState) {
            showDialog(
              context: context,
              builder: (context) =>
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey[200],
                    ),
                  ),
            );
          }
          // Navigator.pop(context);
          if (state is SuccessState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TimeLinePage()));
          }

          if (state is FailureState) {
            Navigator.pop(context);

            ScaffoldMessenger
                .of(context)
                .showSnackBar(
                 SnackBar(duration: const Duration(seconds: 3),
                    content: Text(state.message)));
            }
            },
        child: child);
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('child', child));
  }
}

void showFlashError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
