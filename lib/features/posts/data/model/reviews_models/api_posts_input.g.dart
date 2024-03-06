// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_posts_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPaginateInput _$ApiPaginateInputFromJson(Map<String, dynamic> json) =>
    ApiPaginateInput(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$ApiPaginateInputToJson(ApiPaginateInput instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
