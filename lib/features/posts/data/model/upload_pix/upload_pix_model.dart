// To parse this JSON data, do
//
//     final apiUploadPhoto = apiUploadPhotoFromJson(jsonString);

import 'dart:convert';

ApiUploadPhotoResult apiUploadPhotoFromJson(String str) => ApiUploadPhotoResult.fromJson(json.decode(str));

String apiUploadPhotoToJson(ApiUploadPhotoResult data) => json.encode(data.toJson());

class ApiUploadPhotoResult {
  final UploadFile? uploadFile;

  ApiUploadPhotoResult({
    this.uploadFile,
  });

  factory ApiUploadPhotoResult.fromJson(Map<String, dynamic> json) => ApiUploadPhotoResult(
    uploadFile: json["uploadFile"] == null ? null : UploadFile.fromJson(json["uploadFile"]),
  );

  Map<String, dynamic> toJson() => {
    "uploadFile": uploadFile?.toJson(),
  };
}

class UploadFile {
  final String? data;
  final int? code;
  final String? message;
  final bool? success;

  UploadFile({
    this.data,
    this.code,
    this.message,
    this.success,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
    data: json["data"],
    code: json["code"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "code": code,
    "message": message,
    "success": success,
  };
}
