import 'package:yadlo/features/auth/registration/domain/entities/registration_user_input.dart';

import '../repositories/registration_repo.dart';

class RegisterUseCase {
  final UserRegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<void> register(RegistrationInput registerInput) async {
    return await _registerRepository.register(registerInput);
  }
}
