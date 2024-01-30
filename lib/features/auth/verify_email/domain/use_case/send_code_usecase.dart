

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/verify_email/domain/entities/send_code_ent.dart';
import 'package:yadlo/features/auth/verify_email/domain/user_repo/send_code_repo.dart';

class SendCodeUseCase {
  final SendCodeRepositories _sendCodeRepositories;

  SendCodeUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> sendCode(SendCodeInput input)async{
    return await _sendCodeRepositories.sendCode(input);

  }
}