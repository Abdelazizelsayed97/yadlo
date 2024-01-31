import 'package:equatable/equatable.dart';

class SendCodeInput extends Equatable {
  final String email;

  const SendCodeInput({required this.email});

  @override
  List<Object?> get props => [email];
}
