// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_attachments_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAttachmentsInput _$ApiAttachmentsInputFromJson(Map<String, dynamic> json) =>
    ApiAttachmentsInput(
      link: json['link'] as String,
      attachmentType:
          $enumDecode(_$ApiAttachmentsTypeEnumMap, json['attachmentType']),
    );

Map<String, dynamic> _$ApiAttachmentsInputToJson(
        ApiAttachmentsInput instance) =>
    <String, dynamic>{
      'link': instance.link,
      'attachmentType': _$ApiAttachmentsTypeEnumMap[instance.attachmentType]!,
    };

const _$ApiAttachmentsTypeEnumMap = {
  ApiAttachmentsType.PHOTO: 'PHOTO',
  ApiAttachmentsType.VIDEO: 'VIDEO',
};
