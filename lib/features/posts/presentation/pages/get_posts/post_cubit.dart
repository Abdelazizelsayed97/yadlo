import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:yadlo/core/pagination/paganated_data.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';
import 'package:yadlo/features/posts/domain/use_cases/upload_pix_usecase.dart';

import '../../../domain/entities /create_post_input.dart';
import '../../../domain/use_cases/create_review_usecase.dart';
import '../../../domain/use_cases/delete_review_usecase.dart';
import '../../../domain/use_cases/get_all_review_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllPostsUseCase _getAllPostsUseCase;
  final CreateReviewUseCase _createReviewUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final UploadPixUseCase _uploadPixUseCase;

  final formKey = GlobalKey<FormState>();

  PostCubit(
    this._getAllPostsUseCase,
    this._createReviewUseCase,
    this._deletePostUseCase,
    this._uploadPixUseCase,
  ) : super(PostInitial());


  Future getAllPosts(int pageKey) async {
    emit(PostLoading());
    final response = await _getAllPostsUseCase.getAllPosts(pageKey);
    emit(PostInitial());
    response.fold((l) {
      emit(PostFailure(l.message ?? ''));
    }, (r) async {
      emit(PostSuccess(r));
    });
  }

  Future<void> createReview({required CreateReviewInput input}) async {
    emit(CreateReviewLoadingState());
    final result = await _createReviewUseCase(input);
    result.fold((l) {
      emit(CreateReviewFailureState(message: l.message ?? ''));
    }, (r) async {
      emit(CreateReviewSuccessState(input: input));
    });
  }

  void deletePost({required String reviewId}) async {
    emit(DeleteReviewLoadingState());
    final response = await _deletePostUseCase.execute(reviewId);
    response.fold((l) {
      emit(DeleteReviewFailureState(message: l.message ?? ''));
    }, (r) async {
      emit(DeleteReviewSuccessState());
    });
  }

  Future uploadImageCover({
    required UploadInput input,
  }) async {
    emit(DeleteReviewLoadingState());
    final response = await _uploadPixUseCase.execute(input);
    response.fold((l) {
      emit(UploadingImageFailure(message: l.message ?? ''));
    }, (r) {
      final imageUrl = emit(UploadImageSuccess(link: r));
    });
  }

  Future<void> sendAddReview({
    required UploadInput inputUpload,
    required CreateReviewInput inputCreate,
  }) async {
    try {
      emit(AddReviewLoading());
      // await uploadImageCover(input: inputUpload);
      final response = await _uploadPixUseCase.execute(inputUpload);
      response.fold((l) {
        emit(AddReviewFailure(message: l.message ?? ""));
      }, (r) async {
        final imageUrl = r;
        await createReview(input: inputCreate);

        // emit(CreateReviewLoadingState());
        // final result = await _createReviewUseCase(inputCreate);
        // result.fold((l) {
        //   emit(CreateReviewFailureState(message: l.message ?? ''));
        // }, (r) async {
        //   emit(CreateReviewSuccessState(input: inputCreate));
        //   // emit(CreateReviewSuccessState(
        //   //     input: CreateReviewInput(
        //   //   // selectedType: inputCreate.selectedType,
        //   //   // overallRating: inputCreate.overallRating,
        //   //   // description: inputCreate.description,
        //   //   attachments: AttachmentsModelInput(
        //   //     imageUrl: imageUrl,
        //   //     // attachmentType: inputCreate.attachments!.attachmentType,
        //   //   ),
        //   //   // categoryId: inputCreate.categoryId,
        //   //   // subcategoryId: inputCreate.subcategoryId,
        //   //   // name: inputCreate.name,
        //   //   // title: inputCreate.title
        //   // )));
        // });

        emit(AddReviewSuccess(r));
      });
      // await createReview(input: inputCreate);
    } catch (e) {
      emit(AddReviewFailure(message: e.toString()));
    }
  }
}
