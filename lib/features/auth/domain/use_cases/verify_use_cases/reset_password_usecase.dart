import 'package:dartz/dartz.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';

import '../../../../../core/errors/login/Failure.dart';
import '../../repositories/verify_repo.dart';

class ResetPasswordUseCase {
  final SendCodeRepositories _sendCodeRepositories ;

  ResetPasswordUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> resetPassword(ResetPasswordInput input)async{
    return await _sendCodeRepositories.resetPassword(input);

  }
}