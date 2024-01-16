import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/domain/usecases/login_usecase.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  void login(LoginInput input) {
    _loginUseCase.call(input);
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
