// To parse this JSON data, do
//
//     final apiRegisterResult = apiRegisterResultFromJson(jsonString);

import 'dart:convert';

ApiRegisterResult apiRegisterResultFromJson(String str) => ApiRegisterResult.fromJson(json.decode(str));

String apiRegisterResultToJson(ApiRegisterResult data) => json.encode(data.toJson());

class ApiRegisterResult {
  final Register? register;

  ApiRegisterResult({
    this.register,
  });

  factory ApiRegisterResult.fromJson(Map<String, dynamic> json) => ApiRegisterResult(
    register: json["register"] == null ? null : Register.fromJson(json["register"]),
  );

  Map<String, dynamic> toJson() => {
    "register": register?.toJson(),
  };
}

class Register {
  final Data? data;
  final bool? success;
  final int? code;
  final String? message;

  Register({
    this.data,
    this.success,
    this.code,
    this.message,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "code": code,
    "message": message,
  };
}

class Data {
  final dynamic verifiedEmail;

  Data({
    this.verifiedEmail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    verifiedEmail: json["verifiedEmail"],
  );

  Map<String, dynamic> toJson() => {
    "verifiedEmail": verifiedEmail,
  };
}
