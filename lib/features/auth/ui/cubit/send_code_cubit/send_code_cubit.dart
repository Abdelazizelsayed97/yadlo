import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/verify_use_case.dart';

import '../../../domain/entities/send_code_entites.dart';
import '../../../domain/use_cases/verify_use_cases/reset_password_usecase.dart';
import '../../../domain/use_cases/verify_use_cases/send_code_usecase.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  final SendCodeUseCase _sendCodeUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final formKey = GlobalKey<FormState>();

  // final RegistrationInput input;
  SendCodeCubit(
    this._sendCodeUseCase,
    this._verifyEmailUseCase,
    this._resetPasswordUseCase,
  ) : super(SendCodeInitial());

  void emitSendCodeStates({required SendCodeInput input}) async {
    print("EFFEEF ${input.useCase}");
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
    required VerifyCodeInput input,
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

  void emitResetSendCodeStates({required SendCodeInput input}) async {
    print("EFFEEF ${input.useCase}");
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

  void validateResetPassword({required ResetPasswordInput input}) async {
    emit(ResetLoading());
    final response = await _resetPasswordUseCase.resetPassword(input);
    response.fold((l) {
      if (l.code != 200) {
        emit(ResetFailure(l.message ?? ''));
      }
    }, (r) {
      emit(ResetSuccess());
    });
  }
}
