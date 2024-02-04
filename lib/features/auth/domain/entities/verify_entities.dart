import 'package:equatable/equatable.dart';

class SendCodeInput extends Equatable {
  final String email;
  final String? verificationCode;

  const SendCodeInput({

    required this.email,
    this.verificationCode,
  });

  @override
  List<Object?> get props => [
        email,
        verificationCode,
      ];
}
