

import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/repositories/auth_repository.dart';

import '../../entities/send_code_entites.dart';

class SendCodeUseCase {
  final AuthRepository _sendCodeRepositories;

  SendCodeUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> sendCode(SendCodeInput input)async{
    return await _sendCodeRepositories.sendCode(input);

  }
}