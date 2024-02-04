import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_send_code_input.g.dart';

@JsonSerializable()
class ApiSendCodeInput {
  final String email;
  final String useCase;

  ApiSendCodeInput(
     {required this.useCase,
    required this.email,
  });

  factory ApiSendCodeInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSendCodeInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSendCodeInputToJson(this);
}
