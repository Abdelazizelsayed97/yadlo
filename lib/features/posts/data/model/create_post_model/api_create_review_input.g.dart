// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_create_review_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCreateReviewInput _$ApiCreateReviewInputFromJson(
        Map<String, dynamic> json) =>
    ApiCreateReviewInput(
      categoryId: json['categoryId'] as String,
      subcategoryId: json['subcategoryId'] as String,
      title: json['title'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecodeNullable(_$ApiTypeEnumMap, json['type']),
      overallRating: $enumDecodeNullable(
          _$ApiOverAllRatingEnumTypeEnumMap, json['overallRating']),
      attachments: json['attachments'] == null
          ? null
          : ApiAttachmentsInput.fromJson(
              json['attachments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCreateReviewInputToJson(
        ApiCreateReviewInput instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'subcategoryId': instance.subcategoryId,
      'title': instance.title,
      'name': instance.name,
      'description': instance.description,
      'type': _$ApiTypeEnumMap[instance.type],
      'overallRating':
          _$ApiOverAllRatingEnumTypeEnumMap[instance.overallRating],
      'attachments': instance.attachments,
    };

const _$ApiTypeEnumMap = {
  ApiType.PRODUCT: 'PRODUCT',
  ApiType.PLACE: 'PLACE',
};

const _$ApiOverAllRatingEnumTypeEnumMap = {
  ApiOverAllRatingEnumType.HAPPY: 'HAPPY',
  ApiOverAllRatingEnumType.GOOD: 'GOOD',
  ApiOverAllRatingEnumType.OK: 'OK',
  ApiOverAllRatingEnumType.SAD: 'SAD',
  ApiOverAllRatingEnumType.ANGRY: 'ANGRY',
};
