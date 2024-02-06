import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/repositories/set_newpass_repo.dart';

class SetNewPasswordUseCase{
  final SetNewPasswordRepository setNewPasswordRepository;
  SetNewPasswordUseCase(this.setNewPasswordRepository);

  Future<Either<ApiError, void>> setNewPassword(SetNewPasswordInput input) async {
    return await setNewPasswordRepository.setNewPassword(input);
  }
}