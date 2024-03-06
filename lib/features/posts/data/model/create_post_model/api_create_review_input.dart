import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yadlo/features/posts/data/model/create_post_model/inputs/api_attachments_input.dart';

import '../../../domain/entities /create_post_input.dart';

part 'api_create_review_input.g.dart';

@JsonSerializable()
class ApiCreateReviewInput {
  final String categoryId;
  final String subcategoryId;
  final String title;
  final String name;
  final String description;
  final ApiType? type;
  final ApiOverAllRatingEnumType? overallRating;
  final ApiAttachmentsInput? attachments;

  ApiCreateReviewInput({
    required this.categoryId,
    required this.subcategoryId,
    required this.title,
    required this.name,
    required this.description,
    required this.type,
    this.overallRating,
    this.attachments,
  });

  factory ApiCreateReviewInput.fromJson(Map<String, dynamic> json) =>
      _$ApiCreateReviewInputFromJson(json);

  factory ApiCreateReviewInput.fromInput(CreateReviewInput input) {
    return ApiCreateReviewInput(
      categoryId: input.categoryId ?? '',
      subcategoryId: input.subcategoryId ?? '',
      title: input.title ?? '',
      name: input.name ?? '',
      description: input.description ?? "",
      type:
          (input.selectedType == null) ? null : getApiType(input.selectedType!),
      overallRating: (input.overallRating == null)
          ? null
          : getApiRating(input.overallRating!),
      attachments: (input.attachments == null)
          ? null
          : ApiAttachmentsInput.fromAttachmentsInput(input.attachments!),
    );
  }

  Map<String, dynamic> toJson() => _$ApiCreateReviewInputToJson(this);
}

enum ApiOverAllRatingEnumType {
  HAPPY,
  GOOD,
  OK,
  SAD,
  ANGRY,
}

enum ApiType { PRODUCT, PLACE }

ApiOverAllRatingEnumType? getApiRating(OverAllRatingEnum type) {
  switch (type) {
    case OverAllRatingEnum.happy:
      return ApiOverAllRatingEnumType.HAPPY;
    case OverAllRatingEnum.good:
      return ApiOverAllRatingEnumType.GOOD;
    case OverAllRatingEnum.ok:
      return ApiOverAllRatingEnumType.OK;
    case OverAllRatingEnum.sad:
      return ApiOverAllRatingEnumType.SAD;
    case OverAllRatingEnum.angy:
      return ApiOverAllRatingEnumType.ANGRY;
  }
}

ApiType getApiType(SelectedTypeEnum type) {
  switch (type) {
    case SelectedTypeEnum.product:
      return ApiType.PRODUCT;
    case SelectedTypeEnum.place:
      return ApiType.PLACE;
  }
}
