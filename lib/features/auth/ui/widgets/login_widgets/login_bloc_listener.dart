import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

import '../../cubit/login_cubit/login_cubit.dart';
import '../../cubit/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    super.key,
    this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 3),
                content: Text(state.message)));
          }
        },
        child: child);
  }
}

