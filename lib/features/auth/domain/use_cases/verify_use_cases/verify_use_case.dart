import 'package:dartz/dartz.dart';
import 'package:yadlo/features/auth/domain/repositories/auth_repository.dart';
import '../../../../../core/errors/login/Failure.dart';
import '../../entities/verify_entities.dart';

class VerifyEmailUseCase {
  final AuthRepository _sendCodeRepositories;

  VerifyEmailUseCase(this._sendCodeRepositories);
  Future<Either<ApiError,void>> excute(VerifyCodeInput input)async{
    return await _sendCodeRepositories.verify(input);
  }
}