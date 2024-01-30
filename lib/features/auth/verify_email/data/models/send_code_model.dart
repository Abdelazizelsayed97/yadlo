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
  final int? code;
  final bool? success;
  final String? message;

  SendEmailVerificationCode({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SendEmailVerificationCode.fromJson(Map<String, dynamic> json) => SendEmailVerificationCode(
    data: json["data"],
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "code": code,
    "success": success,
    "message": message,
  };
}
