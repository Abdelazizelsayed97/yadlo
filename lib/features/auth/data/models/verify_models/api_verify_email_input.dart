import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_verify_email_input.g.dart';


@JsonSerializable()
class ApiVerifyEmailInput {
  final String email;
  final String verificationCode;


  ApiVerifyEmailInput({required this.email, required this.verificationCode});


  factory ApiVerifyEmailInput.fromJson(Map<String, dynamic> json) =>
      _$ApiVerifyEmailInputFromJson(json);


  Map<String, dynamic> toJson() => _$ApiVerifyEmailInputToJson(this);
}