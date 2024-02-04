import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/ui/cubit/register_cubit/register_state.dart';

import '../../../domain/use_cases/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  final formKey = GlobalKey<FormState>();

  RegisterCubit(this._registerUseCase) : super(RegInitialState());

  void emitRegisterStates({required RegistrationInput input}) async {
    emit(RegLoadingState());
    final response = await _registerUseCase.register(input);

    response.fold(
      (left) {
        emit(RegFailureState(left.message ?? ''));
            },
      (right) {
        emit(RegSuccessState(right.email));

      },
    );
  }
}
