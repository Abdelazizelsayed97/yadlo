import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_state.dart';

import '../../registration/data/model/register_response.dart';
import '../../registration/domain/entities/registration_user_input.dart';
import '../../registration/domain/use_cases/register_use_case.dart';
import '../login_cubit/login_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterCubit(
    this._registerUseCase,
  ) : super(InitialState() as RegisterState);

  // void emitRegisterStates({required RegisterInput input}) async {
  //   emit(LoadingState() as RegisterState);
  //   emit(InitialState() as RegisterState);
  //   try {
  //     final response = await _registerUseCase.call(input);
  //     // emit(RegisterState.success(response));
  //     emit(SuccessState() as RegisterState);
  //   } catch (error) {
  //     emit(FailureState() as RegisterState);
  //
  //   }
  // }
  void emitLoginStates() async {
    emit(const RegisterState.loading());
    final response = await _registerUseCase.call(
      RegisterInput(
        email: emailController.text,
        password: passwordController.text,
        username: userNameController.text,
      ),
    );
    //  response.when(success: (RegistrationInput registrationInput) {
    //   emit(const RegisterState.success(RegistrationInput));
    // }, failure: (error) {
    //   emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
    // });
  }
}
