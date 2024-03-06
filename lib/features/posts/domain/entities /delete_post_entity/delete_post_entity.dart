import 'package:equatable/equatable.dart';

class DeleteReviewInput extends Equatable {
  final String reviewId;

  const DeleteReviewInput({
    required this.reviewId,
  });

  @override
  List<Object?> get props => [
        reviewId,
      ];
}
