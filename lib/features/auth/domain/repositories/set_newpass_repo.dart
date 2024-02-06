import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';

abstract class SetNewPasswordRepository{
  Future<Either<ApiError,void>> setNewPassword(SetNewPasswordInput input);
}