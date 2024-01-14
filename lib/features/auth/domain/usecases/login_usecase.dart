import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/domain/entities/user_data.dart';
import 'package:yadlo/features/auth/domain/repository/login_repository.dart';

class LoginUseCase {
  final UserLoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<LoginFailure, UserData>> call(LoginInput input) async {
    return await _loginRepository.login(input);
  }
}
