import 'package:equatable/equatable.dart';

class SendCodeInput extends Equatable {
  final String email;

  const SendCodeInput(this.email);

  List<Object?> get props => [email];
}
