// To parse this JSON data, do
//
//     final apiLoginResult = apiLoginResultFromJson(jsonString);

import 'dart:convert';

ApiLoginResult apiLoginResultFromJson(String str) => ApiLoginResult.fromJson(json.decode(str));

String apiLoginResultToJson(ApiLoginResult data) => json.encode(data.toJson());

class ApiLoginResult {
  final ApiLoginResultData? data;

  ApiLoginResult({
    this.data,
  });

  factory ApiLoginResult.fromJson(Map<String, dynamic> json) => ApiLoginResult(
    data: json["data"] == null ? null : ApiLoginResultData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
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
  final String? id;
  final dynamic displayName;
  final bool? isRegisteredViaSocial;
  final dynamic token;
  final dynamic verifiedEmail;
  final String? unVerifiedEmail;

  RegisterData({
    this.id,
    this.displayName,
    this.isRegisteredViaSocial,
    this.token,
    this.verifiedEmail,
    this.unVerifiedEmail,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    id: json["id"],
    displayName: json["displayName"],
    isRegisteredViaSocial: json["isRegisteredViaSocial"],
    token: json["token"],
    verifiedEmail: json["verifiedEmail"],
    unVerifiedEmail: json["unVerifiedEmail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "displayName": displayName,
    "isRegisteredViaSocial": isRegisteredViaSocial,
    "token": token,
    "verifiedEmail": verifiedEmail,
    "unVerifiedEmail": unVerifiedEmail,
  };
}
