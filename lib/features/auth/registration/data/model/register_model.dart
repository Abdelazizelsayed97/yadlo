// To parse this JSON data, do
//
//     final apiRegisterResult = apiRegisterResultFromJson(jsonString);

import 'dart:convert';

ApiRegisterResult apiRegisterResultFromJson(String str) => ApiRegisterResult.fromJson(json.decode(str));

String apiRegisterResultToJson(ApiRegisterResult data) => json.encode(data.toJson());

class ApiRegisterResult {
  final ApiRegisterResultData? data;

  ApiRegisterResult({
    this.data,
  });

  factory ApiRegisterResult.fromJson(Map<String, dynamic> json) => ApiRegisterResult(
    data: json["data"] == null ? null : ApiRegisterResultData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class ApiRegisterResultData {
  final Register? register;

  ApiRegisterResultData({
    this.register,
  });

  factory ApiRegisterResultData.fromJson(Map<String, dynamic> json) => ApiRegisterResultData(
    register: json["register"] == null ? null : Register.fromJson(json["register"]),
  );

  Map<String, dynamic> toJson() => {
    "register": register?.toJson(),
  };
}

class Register {
  final RegisterData? data;
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
    data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
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

class RegisterData {
  final bool? isRegisteredViaSocial;

  RegisterData({
    this.isRegisteredViaSocial,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    isRegisteredViaSocial: json["isRegisteredViaSocial"],
  );

  Map<String, dynamic> toJson() => {
    "isRegisteredViaSocial": isRegisteredViaSocial,
  };
}
