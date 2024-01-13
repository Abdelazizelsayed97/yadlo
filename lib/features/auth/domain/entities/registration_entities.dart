import 'package:equatable/equatable.dart';

class RegistrationEnt extends Equatable {
  final String name;
  final String email;
  final int password;

  const RegistrationEnt({required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [
    name,
    email,
    password,
  ];
}
