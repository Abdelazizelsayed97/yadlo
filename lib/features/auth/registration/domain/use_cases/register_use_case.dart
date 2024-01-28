import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/registration/domain/entities/registration_user_input.dart';

import '../repositories/registration_repo.dart';

class RegisterUseCase {
  final UserRegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<Either<ApiError,void>> register(RegistrationInput registerInput) async {
    return await _registerRepository.register(registerInput);
  }
}
