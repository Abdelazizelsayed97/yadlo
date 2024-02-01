
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/login/Failure.dart';
import '../entities/send_code_ent.dart';
import '../user_repo/send_code_repo.dart';

class VerifyEmailUseCase {
  final SendCodeRepositories _sendCodeRepositories;

  VerifyEmailUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> excute(SendCodeInput input)async{
    return await _sendCodeRepositories.verify(input);

  }
}