// To parse this JSON data, do
//
//     final apiLoginResult = apiLoginResultFromJson(jsonString);

import 'dart:convert';

ApiRegisterResult apiLoginResultFromJson(String str) => ApiRegisterResult.fromJson(json.decode(str));

String apiLoginResultToJson(ApiRegisterResult data) => json.encode(data.toJson());

class ApiRegisterResult {
  final ApiLoginResultData? apiRegisterData;

  ApiRegisterResult({
    this.apiRegisterData,
  });

  factory ApiRegisterResult.fromJson(Map<String, dynamic> json) => ApiRegisterResult(
    apiRegisterData: json["data"] == null ? null : ApiLoginResultData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": apiRegisterData?.toJson(),
  };
}

class ApiLoginResultData {
  final Register? register;

  ApiLoginResultData({
    this.register,
  });

  factory ApiLoginResultData.fromJson(Map<String, dynamic> json) => ApiLoginResultData(
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
  final dynamic verifiedEmail;
  final String? unVerifiedEmail;

  RegisterData({
    this.isRegisteredViaSocial,
    this.verifiedEmail,
    this.unVerifiedEmail,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    isRegisteredViaSocial: json["isRegisteredViaSocial"],
    verifiedEmail: json["verifiedEmail"],
    unVerifiedEmail: json["unVerifiedEmail"],
  );

  Map<String, dynamic> toJson() => {
    "isRegisteredViaSocial": isRegisteredViaSocial,
    "verifiedEmail": verifiedEmail,
    "unVerifiedEmail": unVerifiedEmail,
  };
}
