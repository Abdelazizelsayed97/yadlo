// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_upload_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUploadFileInput _$ApiUploadFileInputFromJson(Map<String, dynamic> json) =>
    ApiUploadFileInput(
      file: const MultipartJsonConverter().fromJson(json['file']),
      model: $enumDecode(_$ApiFileModelEnumEnumMap, json['model']),
    );

Map<String, dynamic> _$ApiUploadFileInputToJson(ApiUploadFileInput instance) =>
    <String, dynamic>{
      'file': const MultipartJsonConverter().toJson(instance.file),
      'model': _$ApiFileModelEnumEnumMap[instance.model]!,
    };

const _$ApiFileModelEnumEnumMap = {
  ApiFileModelEnum.USERS: 'USERS',
  ApiFileModelEnum.PROFILE_COVER: 'PROFILE_COVER',
  ApiFileModelEnum.PROFILE_PICTURE: 'PROFILE_PICTURE',
  ApiFileModelEnum.REVIEW_ATTACHMENT: 'REVIEW_ATTACHMENT',
  ApiFileModelEnum.COMMENT_ATTACHMENT: 'COMMENT_ATTACHMENT',
  ApiFileModelEnum.AWARD_IMAGE: 'AWARD_IMAGE',
};
