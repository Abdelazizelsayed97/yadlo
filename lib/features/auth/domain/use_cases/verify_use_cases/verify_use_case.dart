
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/login/Failure.dart';
import '../../entities/verify_entities.dart';
import '../../repositories/verify_repo.dart';

class VerifyEmailUseCase {
  final SendCodeRepositories _sendCodeRepositories;

  VerifyEmailUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> excute(SendCodeInput input)async{
    return await _sendCodeRepositories.verify(input);

  }
}