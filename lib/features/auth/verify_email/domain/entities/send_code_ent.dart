import 'package:equatable/equatable.dart';

class SendCodeInput extends Equatable {
  final String email;
  final String? verificationCode;



  const SendCodeInput( {this.verificationCode,required this.email});

  @override
  List<Object?> get props => [email];
}
