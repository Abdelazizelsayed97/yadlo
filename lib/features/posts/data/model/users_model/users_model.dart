// To parse this JSON data, do
//
//     final apiUsersModel = apiUsersModelFromJson(jsonString);

import 'dart:convert';

ApiUsersModel apiUsersModelFromJson(String str) =>
    ApiUsersModel.fromJson(json.decode(str));


class ApiUsersModel {
  final User? user;

  ApiUsersModel({
    this.user,
  });

  factory ApiUsersModel.fromJson(Map<String, dynamic>? json) => ApiUsersModel(
        user: json?["user"] == null ? null : User.fromJson(json?["user"]),
      );
}

class User {
  final ApiUserModel? data;
  final int? code;
  final bool? success;
  final String? message;

  User({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: json["data"] == null ? null : ApiUserModel.fromJson(json["data"]),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );
}

class ApiUserModel {
  final String? id;
  final String? userName;
  final dynamic displayName;
  final String? verifiedEmail;
  final String? gender;
  final String? country;
  final int? reviewsCount;
  final FollowCount? followCount;

  ApiUserModel({
    this.id,
    this.userName,
    this.displayName,
    this.verifiedEmail,
    this.gender,
    this.country,
    this.reviewsCount,
    this.followCount,
  });

  factory ApiUserModel.fromJson(Map<String, dynamic> json) => ApiUserModel(
        id: json["id"],
        userName: json["userName"],
        displayName: json["displayName"],
        verifiedEmail: json["verifiedEmail"],
        gender: json["gender"],
        country: json["country"],
        reviewsCount: json["reviewsCount"],
        followCount: json["followCount"] == null
            ? null
            : FollowCount.fromJson(json["followCount"]),
      );
}

class FollowCount {
  final int? followers;
  final int? followings;

  FollowCount({
    this.followers,
    this.followings,
  });

  factory FollowCount.fromJson(Map<String, dynamic> json) => FollowCount(
        followers: json["followers"],
        followings: json["followings"],
      );
}
