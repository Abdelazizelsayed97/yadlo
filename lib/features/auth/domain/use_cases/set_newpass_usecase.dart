import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/repositories/auth_repository.dart';

class SetNewPasswordUseCase{
  final AuthRepository setNewPasswordRepository;
  SetNewPasswordUseCase(this.setNewPasswordRepository);

  Future<Either<ApiError, void>> setNewPassword(SetNewPasswordInput input) async {
    return await setNewPasswordRepository.setNewPassword(input);
  }
}