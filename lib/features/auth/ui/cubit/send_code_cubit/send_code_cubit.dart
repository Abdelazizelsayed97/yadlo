import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/verify_use_case.dart';

import '../../../domain/use_cases/verify_use_cases/send_code_usecase.dart';


part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  final SendCodeUseCase _sendCodeUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final formKey = GlobalKey<FormState>();

  // final RegistrationInput input;
  SendCodeCubit(
    this._sendCodeUseCase,
    this._verifyEmailUseCase,
  ) : super(SendCodeInitial());

  void emitSendCodeStates({required SendCodeInput input}) async {
    print("EFFEEF ${input.email}");
    emit(SendCodeLoading());
    final response = await _sendCodeUseCase.sendCode(input);
    response.fold((l) {
      if (l.code != 200) {
        emit(SendCodeFailure(l.message ?? ''));
      }
    }, (r) {
      emit(SendCodeSuccess());
    });
  }
  void validateReceivedCode({
    required SendCodeInput input,
  }) async {
    emit(VerifyInitial());
    final response = await _verifyEmailUseCase.excute(input);
    response.fold((l) {
      if (l.code != 200) {
        emit(VerifyFailure(l.message ?? ''));
      }
    }, (r) {
      emit(VerifySuccess());

    });
  }
}
