import 'package:equatable/equatable.dart';

class UploadInput extends Equatable {
  final String fileUrl;
  final FileModelEnum model;

  const UploadInput({
    required this.fileUrl,
    required this.model,
  });

  @override
  List<Object?> get props => [
        fileUrl,
        model,
      ];
}

enum FileModelEnum {
  users,
  profileCover,
  profilePicture,
  reviewAttachment,
  commentAttachment,
  awardImage
}
