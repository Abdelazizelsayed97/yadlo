import 'package:equatable/equatable.dart';

class SetNewPasswordInput extends Equatable{
  final String email;
  final String code;
  final String password;

  const SetNewPasswordInput({required this.email, required this.code, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, code, password];

}