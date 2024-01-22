// To parse this JSON data, do
//
//     final apiLoginResult = apiLoginResultFromJson(jsonString);

import 'dart:convert';

ApiLoginResult apiLoginResultFromJson(String str) => ApiLoginResult.fromJson(json.decode(str));

String apiLoginResultToJson(ApiLoginResult data) => json.encode(data.toJson());

class ApiLoginResult {
  final ApiEmailAndPasswordLogin? emailAndPasswordLogin;

  ApiLoginResult({
    this.emailAndPasswordLogin,
  });

  factory ApiLoginResult.fromJson(Map<String, dynamic> json) => ApiLoginResult(
    emailAndPasswordLogin: json["emailAndPasswordLogin"] == null ? null : ApiEmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
  );

  Map<String, dynamic> toJson() => {
    "emailAndPasswordLogin": emailAndPasswordLogin?.toJson(),
  };
}

class ApiEmailAndPasswordLogin {
  final ApiUserData? data;
  final int? code;
  final bool? success;
  final String? message;

  ApiEmailAndPasswordLogin({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ApiEmailAndPasswordLogin.fromJson(Map<String, dynamic> json) => ApiEmailAndPasswordLogin(
    data: json["data"] == null ? null : ApiUserData.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "success": success,
    "message": message,
  };
}

class ApiUserData {
  final String? id;
  final String? userName;
  final String? token;
  final String? verifiedEmail;

  ApiUserData({
    this.id,
    this.userName,
    this.token,
    this.verifiedEmail,
  });

  factory ApiUserData.fromJson(Map<String, dynamic> json) => ApiUserData(
    id: json["id"],
    userName: json["userName"],
    token: json["token"],
    verifiedEmail: json["verifiedEmail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "token": token,
    "verifiedEmail": verifiedEmail,
  };
}
