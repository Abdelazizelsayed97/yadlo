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
  ) : super( InitialState());

  void emitLoginStates({required LoginInput input}) async {
    emit(LoadingState());
    print('6666666666666');
    final response = await _loginUseCase.call(input);

    response.fold((lift) {
      if (lift is ApiError) {
        print('===============');
        emit(FailureState(lift.message ?? ''));
      }
    }, (right) {
      print('++++++++++++');
      emit(SuccessState(right));
    });

  }
}


// response.fold((left) =>  (l) {
//  emit(L)
//
// }, (right) => (r) {
//         emit(LoginState.success(Success(response)));
//       }
//     );

//   if (response.isRight()) {
//     emit(const LoginState.success(Success(ApiUserData)));
//   } else if (response.isLeft()) {
//     throw ApiErrorMessage(message:ApiEmailAndPasswordLogin().message.toString()?? '');
//   }