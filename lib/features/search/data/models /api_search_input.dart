


import 'package:json_annotation/json_annotation.dart';
part  'api_search_input.g.dart';
@JsonSerializable()
class ApiSearchInput {
  final ApiSearchType searchType;
  final ApiSearchAt searchAt;
  final int? page;
  final int? limit;

  ApiSearchInput(this.page, this.limit, {required this.searchType, required this.searchAt});
  factory ApiSearchInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSearchInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSearchInputToJson(this);

}
enum ApiSearchType{
  SUGGESTED,
  SEARCH_KEY
}
enum ApiSearchAt{
  ALL,
  REVIEWS,
  USERS
}