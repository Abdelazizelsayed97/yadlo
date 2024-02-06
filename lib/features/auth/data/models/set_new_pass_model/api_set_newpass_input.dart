import 'package:json_annotation/json_annotation.dart';

part  'api_set_newpass_input.g.dart'  ;

@JsonSerializable()
class ApiSetNewPasswordInput {
  final String email;
  final String code;
  final String newPassword;


  ApiSetNewPasswordInput(
      {required this.email, required this.newPassword, required this.code});


  factory ApiSetNewPasswordInput.fromJson(Map<String, dynamic> json) =>
      _$SetNewPasswordInputFromJson(json);


  Map<String, dynamic> toJson() => _$SetNewPasswordInputToJson(this);
}