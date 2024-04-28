// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSearchInput _$ApiSearchInputFromJson(Map<String, dynamic> json) =>
    ApiSearchInput(
      json['page'] as int?,
      json['limit'] as int?,
      searchType: $enumDecode(_$ApiSearchTypeEnumMap, json['searchType']),
      searchAt: $enumDecode(_$ApiSearchAtEnumMap, json['searchAt']),
    );

Map<String, dynamic> _$ApiSearchInputToJson(ApiSearchInput instance) =>
    <String, dynamic>{
      'searchType': _$ApiSearchTypeEnumMap[instance.searchType]!,
      'searchAt': _$ApiSearchAtEnumMap[instance.searchAt]!,
      'page': instance.page,
      'limit': instance.limit,
    };

const _$ApiSearchTypeEnumMap = {
  ApiSearchType.SUGGESTED: 'SUGGESTED',
  ApiSearchType.SEARCH_KEY: 'SEARCH_KEY',
};

const _$ApiSearchAtEnumMap = {
  ApiSearchAt.ALL: 'ALL',
  ApiSearchAt.REVIEWS: 'REVIEWS',
  ApiSearchAt.USERS: 'USERS',
};
