// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final WelcomeData data;

  Welcome({
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: WelcomeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class WelcomeData {
  final Register register;

  WelcomeData({
    required this.register,
  });

  factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
    register: Register.fromJson(json["register"]),
  );

  Map<String, dynamic> toJson() => {
    "register": register.toJson(),
  };
}

class Register {
  final RegisterData data;
  final bool success;
  final int code;
  final String message;

  Register({
    required this.data,
    required this.success,
    required this.code,
    required this.message,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    data: RegisterData.fromJson(json["data"]),
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
    "code": code,
    "message": message,
  };
}

class RegisterData {
  final String id;
  final String userName;
  final String slug;
  final String gender;
  final String country;
  final bool isBlocked;
  final bool isFeatured;
  final FollowCount followCount;
  final int totalAwards;
  final String favLang;
  final NotificationManager notificationManager;
  final String readableCreatedAt;
  final int createdAt;
  final int updatedAt;
  final String readableUpdatedAt;
  final bool isRegisteredViaSocial;
  final int reviewsCount;
  final int unseenNotificationsCount;

  RegisterData({
    required this.id,
    required this.userName,
    required this.slug,
    required this.gender,
    required this.country,
    required this.isBlocked,
    required this.isFeatured,
    required this.followCount,
    required this.totalAwards,
    required this.favLang,
    required this.notificationManager,
    required this.readableCreatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.readableUpdatedAt,
    required this.isRegisteredViaSocial,
    required this.reviewsCount,
    required this.unseenNotificationsCount,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    id: json["id"],
    userName: json["userName"],
    slug: json["slug"],
    gender: json["gender"],
    country: json["country"],
    isBlocked: json["isBlocked"],
    isFeatured: json["isFeatured"],
    followCount: FollowCount.fromJson(json["followCount"]),
    totalAwards: json["totalAwards"],
    favLang: json["favLang"],
    notificationManager: NotificationManager.fromJson(json["notificationManager"]),
    readableCreatedAt: json["readableCreatedAt"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    readableUpdatedAt: json["readableUpdatedAt"],
    isRegisteredViaSocial: json["isRegisteredViaSocial"],
    reviewsCount: json["reviewsCount"],
    unseenNotificationsCount: json["unseenNotificationsCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "slug": slug,
    "gender": gender,
    "country": country,
    "isBlocked": isBlocked,
    "isFeatured": isFeatured,
    "followCount": followCount.toJson(),
    "totalAwards": totalAwards,
    "favLang": favLang,
    "notificationManager": notificationManager.toJson(),
    "readableCreatedAt": readableCreatedAt,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "readableUpdatedAt": readableUpdatedAt,
    "isRegisteredViaSocial": isRegisteredViaSocial,
    "reviewsCount": reviewsCount,
    "unseenNotificationsCount": unseenNotificationsCount,
  };
}

class FollowCount {
  final int followers;
  final int followings;

  FollowCount({
    required this.followers,
    required this.followings,
  });

  factory FollowCount.fromJson(Map<String, dynamic> json) => FollowCount(
    followers: json["followers"],
    followings: json["followings"],
  );

  Map<String, dynamic> toJson() => {
    "followers": followers,
    "followings": followings,
  };
}

class NotificationManager {
  final bool viaPush;
  final bool newVoteOnReview;
  final bool newAward;
  final bool newReplyOnComment;
  final bool newFollower;

  NotificationManager({
    required this.viaPush,
    required this.newVoteOnReview,
    required this.newAward,
    required this.newReplyOnComment,
    required this.newFollower,
  });

  factory NotificationManager.fromJson(Map<String, dynamic> json) => NotificationManager(
    viaPush: json["VIA_PUSH"],
    newVoteOnReview: json["NEW_VOTE_ON_REVIEW"],
    newAward: json["NEW_AWARD"],
    newReplyOnComment: json["NEW_REPLY_ON_COMMENT"],
    newFollower: json["NEW_FOLLOWER"],
  );

  Map<String, dynamic> toJson() => {
    "VIA_PUSH": viaPush,
    "NEW_VOTE_ON_REVIEW": newVoteOnReview,
    "NEW_AWARD": newAward,
    "NEW_REPLY_ON_COMMENT": newReplyOnComment,
    "NEW_FOLLOWER": newFollower,
  };
}
