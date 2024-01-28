
import '../entities/registration_user_input.dart';

abstract class UserRegisterRepository{
  Future<void> register(RegistrationInput input);
}
