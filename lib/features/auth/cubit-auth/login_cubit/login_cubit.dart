import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../../login/domain/entities/login_input.dart';
import '../../login/domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  final formKey = GlobalKey<FormState>();

  LoginCubit(
    this._loginUseCase,
  ) : super(InitialState());

  void emitLoginStates({required LoginInput input}) async {
    emit(LoadingState());
    final response = await _loginUseCase.call(input);

    response.fold((lift) {
      if (lift is ApiError) {
        emit(FailureState(lift.message ?? ''));
      }
    }, (right) {
      emit(SuccessState(right));
    });
  }
}
