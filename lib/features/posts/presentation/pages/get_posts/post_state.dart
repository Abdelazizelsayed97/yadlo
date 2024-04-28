part of 'post_cubit.dart';

@immutable
abstract class PostState extends Equatable {}

class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class PostSuccess extends PostState {
  final PaginatedData<PostsEntity> getPostState;

  PostSuccess(this.getPostState);

  @override
  List<Object?> get props => [
        getPostState,
      ];
}

// ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
class PostFailure extends PostState {
  final String message;

  PostFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CreateReviewInitial extends PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateReviewLoadingState extends PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateReviewSuccessState extends PostState {
  final CreateReviewInput input;

  CreateReviewSuccessState({required this.input});

  @override
  // TODO: implement props
  List<Object?> get props => [input];
}

class CreateReviewFailureState extends PostState {
  final String message;

  CreateReviewFailureState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
      ];
}

// +++++++++++++++++++++++++++++++++++++++++++++++

class DeleteReviewLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

class DeleteReviewSuccessState extends PostState {
  DeleteReviewSuccessState();

  @override
  List<Object?> get props => [];
}

class DeleteReviewFailureState extends PostState {
  final String message;

  DeleteReviewFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
// +++++++++++++++++++Pix================================

class UploadingImageLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class UploadImageSuccess extends PostState {
   String link;

  UploadImageSuccess({required this.link});

  @override
  List<Object?> get props => [link];
}

class UploadingImageFailure extends PostState {
  final String message;

  UploadingImageFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

///////////
class AddReviewInitial extends PostState {
  final String xx;

  AddReviewInitial({required this.xx});
  @override
  List<Object?> get props => [xx];
}

class AddReviewLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class AddReviewSuccess extends PostState {
   String link;

  AddReviewSuccess(this.link);

  @override
  List<Object?> get props => [link];
}

class AddReviewFailure extends PostState {
  final String message;

  AddReviewFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
