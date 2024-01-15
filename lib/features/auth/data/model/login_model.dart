// To parse this JSON data, do
//
//     final apiloginResult = apiloginResultFromJson(jsonString);

import 'dart:convert';

ApiLoginResult apiloginResultFromJson(String str) =>
    ApiLoginResult.fromJson(json.decode(str));

String apiloginResultToJson(ApiLoginResult data) => json.encode(data.toJson());

class ApiLoginResult {
  final EmailAndPasswordLogin emailAndPasswordLogin;

  ApiLoginResult({
    required this.emailAndPasswordLogin,
  });

  factory ApiLoginResult.fromJson(Map<String, dynamic> json) => ApiLoginResult(
        emailAndPasswordLogin:
            EmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "emailAndPasswordLogin": emailAndPasswordLogin.toJson(),
      };
}

class EmailAndPasswordLogin {
  final ApiUserData data;
  final String message;
  final bool success;
  final int code;

  EmailAndPasswordLogin({
    required this.data,
    required this.message,
    required this.success,
    required this.code,
  });

  factory EmailAndPasswordLogin.fromJson(Map<String, dynamic> json) =>
      EmailAndPasswordLogin(
        data: ApiUserData.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "success": success,
        "code": code,
      };
}

  class ApiUserData {
  final String id;
  final String userName;
  final String token;

  ApiUserData({
    required this.id,
    required this.userName,
    required this.token,
  });

  factory ApiUserData.fromJson(Map<String, dynamic> json) => ApiUserData(
        id: json["id"],
        userName: json["userName"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "token": token,
      };
}


