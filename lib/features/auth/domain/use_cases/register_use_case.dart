import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/domain/repositories/auth_repository.dart';


class RegisterUseCase {
  final AuthRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<Either<ApiError,RegistrationInput>> register(RegistrationInput input) async {
    return await _registerRepository.register(input);
  }
}
