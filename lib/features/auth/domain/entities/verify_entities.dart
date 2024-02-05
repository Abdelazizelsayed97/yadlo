import 'package:equatable/equatable.dart';

class VerifyCodeInput extends Equatable {
  final String email;
  final String? verificationCode;

  const VerifyCodeInput({

    required this.email,
    this.verificationCode,
  });

  @override
  List<Object?> get props => [
        email,
        verificationCode,
      ];
}
