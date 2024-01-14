import 'package:json_annotation/json_annotation.dart';

part 'api_login_input.g.dart';

@JsonSerializable()
class ApiLoginInput {
  final String email;
  final String password;
  final String device;

  ApiLoginInput(
      {required this.email, required this.password, required this.device});

  factory ApiLoginInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLoginInputToJson(this);
}

