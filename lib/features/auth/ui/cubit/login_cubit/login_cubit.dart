import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/ui/widgets/login_widgets/shared_preferances.dart';

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
    print('${response.mapWithIndex}');
    response.fold((left) {
      if (left is ApiError) {
        emit(
          FailureState(left.message ?? ''),
        );
      }
    }, (right) async {
      emit(SuccessState(right));
    });
  }
}
