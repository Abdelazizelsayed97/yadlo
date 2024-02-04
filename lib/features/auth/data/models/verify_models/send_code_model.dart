// To parse this JSON data, do
//
//     final sendCode = sendCodeFromJson(jsonString);

import 'dart:convert';

SendCode sendCodeFromJson(String str) => SendCode.fromJson(json.decode(str));

String sendCodeToJson(SendCode data) => json.encode(data.toJson());

class SendCode {
  final SendEmailVerificationCode? sendEmailVerificationCode;

  SendCode({
    this.sendEmailVerificationCode,
  });

  factory SendCode.fromJson(Map<String, dynamic> json) => SendCode(
    sendEmailVerificationCode: json["sendEmailVerificationCode"] == null ? null : SendEmailVerificationCode.fromJson(json["sendEmailVerificationCode"]),
  );

  Map<String, dynamic> toJson() => {
    "sendEmailVerificationCode": sendEmailVerificationCode?.toJson(),
  };
}

class SendEmailVerificationCode {
  final bool? data;
  final bool? success;
  final int? code;
  final String? message;

  SendEmailVerificationCode({
    this.data,
    this.success,
    this.code,
    this.message,
  });

  factory SendEmailVerificationCode.fromJson(Map<String, dynamic> json) => SendEmailVerificationCode(
    data: json["data"],
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "success": success,
    "code": code,
    "message": message,
  };
}
