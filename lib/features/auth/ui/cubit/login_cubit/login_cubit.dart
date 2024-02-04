import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../../../domain/entities/login_entites/login_input.dart';
import '../../../domain/use_cases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  final formKey = GlobalKey<FormState>();

  LoginCubit(this._loginUseCase) : super(InitialState());

  void emitLoginStates({required LoginInput input}) async {
    emit(LoadingState());
    final response = await _loginUseCase.login(input);

    response.fold((lift) {
      if (lift is ApiError) {
        emit(
          FailureState(lift.message ?? ''),
        );
      }
    }, (right) {
      emit(SuccessState(right));
    });
  }
}
