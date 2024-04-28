import 'package:mime/mime.dart';
import 'package:yadlo/features/posts/data/model/upload_pix/api_upload_input.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';
import 'package:http/http.dart' show MultipartFile;
import "package:http_parser/http_parser.dart" show MediaType;

extension UploadInputToApiMapper on UploadInput {
  Future<ApiUploadFileInput> mapper() async {
    try {
      final filename = fileUrl.split("/").last;
      final file = await MultipartFile.fromPath(
        "",
        fileUrl,
        filename: filename,
        contentType: getMimeType(),
      );
      return ApiUploadFileInput(
        file: file,
        model: model.mapEnum(),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
///Users/baianat/Library/Developer/CoreSimulator/Devices/2A8819E5-F089-4F80-94DE-0F5051ED5C12/data/Containers/Data/Application/92948C9E-1888-4EA6-B124-11D36861C811/tmp/image_picker_B15D1881-6F44-452B-8AB7-ABEE5E39B7B6-13619-000009405A0BBD0E.jpg
  MediaType getMimeType() {
    final mime = lookupMimeType(fileUrl);
    if (mime != null) {
      final splits = mime.split("/");
      final type = splits.firstOrNull ?? "";
      final subtype = splits.lastOrNull ?? "";
      return MediaType(type, subtype);
    } else {
      return MediaType("", "");
    }
  }
}

extension on FileModelEnum {
  ApiFileModelEnum mapEnum() {
    switch (this) {
      case FileModelEnum.users:
        return ApiFileModelEnum.USERS;
      case FileModelEnum.profileCover:
        return ApiFileModelEnum.PROFILE_COVER;
      case FileModelEnum.profilePicture:
        return ApiFileModelEnum.PROFILE_PICTURE;
      case FileModelEnum.reviewAttachment:
        return ApiFileModelEnum.REVIEW_ATTACHMENT;
      case FileModelEnum.commentAttachment:
        return ApiFileModelEnum.COMMENT_ATTACHMENT;
      case FileModelEnum.awardImage:
        return ApiFileModelEnum.AWARD_IMAGE;
    }
  }
}
