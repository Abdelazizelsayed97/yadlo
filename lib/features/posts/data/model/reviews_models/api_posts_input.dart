import 'package:json_annotation/json_annotation.dart';

part 'api_posts_input.g.dart';

@JsonSerializable()
class ApiPaginateInput {
  final int? page;
  final int? limit;

  ApiPaginateInput({
    this.page,
    this.limit,
  });
  factory ApiPaginateInput.fromJson(Map<String, dynamic> json) =>
      _$ApiPaginateInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPaginateInputToJson(this);
}
