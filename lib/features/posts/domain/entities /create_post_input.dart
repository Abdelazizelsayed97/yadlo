import 'package:equatable/equatable.dart';

class CreateReviewInput extends Equatable {
  final String? categoryId;
  final String? subcategoryId;
  final String? title;
  final String? name;
  final String? description;
  final SelectedTypeEnum? selectedType;
  final OverAllRatingEnum? overallRating;
  final AttachmentsModelInput? attachments;

  const CreateReviewInput({
    this.attachments,
    this.categoryId,
    this.subcategoryId,
    this.title,
    this.name,
    this.description,
    this.selectedType,
    this.overallRating,
  });

  @override
  List<Object?> get props => [
        categoryId,
        subcategoryId,
        title,
        name,
        description,
        selectedType,
        overallRating,
        attachments
      ];
}

class AttachmentsModelInput extends Equatable {
  final String? imageUrl;
  final AttachmentType? attachmentType;

  const AttachmentsModelInput({
     this.imageUrl,
     this.attachmentType,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        attachmentType,
      ];
}

enum SelectedTypeEnum { product, place }

extension ConverSelectedTypeName on SelectedTypeEnum {
  String get localizationName {
    switch (this) {
      case SelectedTypeEnum.place:
        return 'PLACE';
      case SelectedTypeEnum.product:
        return 'PRODUCT';
    }
  }

  String get icon {
    switch (this) {
      case SelectedTypeEnum.place:
        return "assets/posts/location.svg";
      case SelectedTypeEnum.product:
        return "assets/posts/product.svg";
    }
  }

  String get subTitle {
    switch (this) {
      case SelectedTypeEnum.place:
        return "Add a Review For a tangible or not tangible Product you experienced it ";
      case SelectedTypeEnum.product:
        return "Add a Review For a Place that Served you, a Tourist place or any other place  ";
    }
  }
}

enum AttachmentType { photo, video }

enum OverAllRatingEnum {
  happy,
  good,
  ok,
  sad,
  angy,
}
