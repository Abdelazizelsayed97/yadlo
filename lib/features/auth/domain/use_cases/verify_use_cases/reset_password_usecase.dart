import 'package:dartz/dartz.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';
import 'package:yadlo/features/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/errors/login/Failure.dart';

class ResetPasswordUseCase {
  final AuthRepository _sendCodeRepositories ;

  ResetPasswordUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> resetPassword(ResetPasswordInput input)async{
    return await _sendCodeRepositories.resetPassword(input);

  }
}