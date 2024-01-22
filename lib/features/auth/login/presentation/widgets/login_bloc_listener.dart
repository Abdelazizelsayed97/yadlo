import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_cubit.dart';
import 'package:yadlo/features/auth/cubit-auth/login_cubit/login_state.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is Loading || current is Success,
        listener: (context, state) {
          if (state is Loading) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[200],
                ),
              ),
            );
          }
          if (state is Success) {
            print('SuccessSuccessSuccessSuccessSuccessSuccessSuccess');
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TimeLinePage()));
          }
          if (state is Error) {
            const ScaffoldMessenger(
                child: SnackBar(content: Text('Wrong Data')));
          }
        },
        child: child);
  }
}
