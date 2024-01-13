// To parse this JSON data, do
//
//     final apiloginResult = apiloginResultFromJson(jsonString);

import 'dart:convert';

ApiloginResult apiloginResultFromJson(String str) =>
    ApiloginResult.fromJson(json.decode(str));

String apiloginResultToJson(ApiloginResult data) => json.encode(data.toJson());

class ApiloginResult {
  final EmailAndPasswordLogin emailAndPasswordLogin;

  ApiloginResult({
    required this.emailAndPasswordLogin,
  });

  factory ApiloginResult.fromJson(Map<String, dynamic> json) => ApiloginResult(
        emailAndPasswordLogin:
            EmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "emailAndPasswordLogin": emailAndPasswordLogin.toJson(),
      };
}

class EmailAndPasswordLogin {
  final Data data;
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
        data: Data.fromJson(json["data"]),
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

class Data {
  final String id;
  final String userName;
  final String token;

  Data({
    required this.id,
    required this.userName,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
