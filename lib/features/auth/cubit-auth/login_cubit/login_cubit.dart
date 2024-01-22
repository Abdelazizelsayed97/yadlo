import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/data/model/login_model.dart';
import '../../login/domain/entities/login_input.dart';
import '../../login/domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  void emitLoginStates() async {
    emit(const LoginState.loading());
    try {
      final response = await _loginUseCase.call(
        LoginInput(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      emit(LoginState.success(response));
    } catch (e) {
      print(e.toString());
      emit(const LoginState.error(error:'kanfkna,nflan'?? ''));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
