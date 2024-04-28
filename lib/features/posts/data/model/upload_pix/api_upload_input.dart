import 'package:http/http.dart' show MultipartFile;
import 'package:json_annotation/json_annotation.dart';

part 'api_upload_input.g.dart';

@JsonSerializable()
class ApiUploadFileInput {
  @MultipartJsonConverter()
  final MultipartFile file;
  final ApiFileModelEnum model;

  ApiUploadFileInput({
    required this.file,
    required this.model,
  });

  factory ApiUploadFileInput.fromJson(Map<String, dynamic> json) =>
      _$ApiUploadFileInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUploadFileInputToJson(this);
}

enum ApiFileModelEnum {
  USERS,
  PROFILE_COVER,
  PROFILE_PICTURE,
  REVIEW_ATTACHMENT,
  COMMENT_ATTACHMENT,
  AWARD_IMAGE
}

class MultipartJsonConverter implements JsonConverter<MultipartFile, dynamic> {
  const MultipartJsonConverter();

  @override
  MultipartFile fromJson(json) {
    throw "";
  }

  @override
  toJson(MultipartFile object) {
    return object;
  }
}
