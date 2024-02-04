import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_registar_input.g.dart';

@JsonSerializable()
class ApiRegisterInput {
  final String userName;
  final String email;
  final String password;
  final String device;
  final String country;

  ApiRegisterInput(
      {required this.country,
        required this.email, required this.password, required this.device, required this.userName});

  factory ApiRegisterInput.fromJson(Map<String, dynamic> json) =>
      _$ApiRegisterInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRegisterInputToJson(this);
}
