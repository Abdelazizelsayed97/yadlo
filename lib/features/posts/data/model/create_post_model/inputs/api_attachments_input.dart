import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities /create_post_input.dart';

part 'api_attachments_input.g.dart';

@JsonSerializable()
class ApiAttachmentsInput {
  final String link;
  final ApiAttachmentsType attachmentType;

  ApiAttachmentsInput({
    required this.link,
    required this.attachmentType,
  });

  factory ApiAttachmentsInput.fromJson(Map<String, dynamic> json) =>
      _$ApiAttachmentsInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiAttachmentsInputToJson(this);

  factory ApiAttachmentsInput.fromAttachmentsInput(
    AttachmentsModelInput input,
  ) {
    print('Api input ${input}');
    final sendAttachmentsType = getApiAttachmentsType(input.attachmentType);
    return ApiAttachmentsInput(
      link: input.imageUrl,
      attachmentType: sendAttachmentsType,
    );
  }
}

enum ApiAttachmentsType {
  PHOTO,
  VIDEO,
}

ApiAttachmentsType getApiAttachmentsType(AttachmentType type) {
  switch (type) {
    case AttachmentType.photo:
      return ApiAttachmentsType.PHOTO;
    case AttachmentType.video:
      return ApiAttachmentsType.VIDEO;
  }
}
