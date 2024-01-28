import 'package:equatable/equatable.dart';

class RegistrationInput extends Equatable {
  final String userName;
  final String email;
  final String password;

  const RegistrationInput({required this.userName, required this.email, required this.password});


  @override
  List<Object?> get props => [
    userName,
    email,
    password,
  ];
}
