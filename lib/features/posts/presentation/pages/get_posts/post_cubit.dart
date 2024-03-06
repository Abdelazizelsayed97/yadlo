import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:yadlo/core/paganated_data.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';

import '../../../domain/entities /create_post_input.dart';
import '../../../domain/use_cases/create_review_usecase.dart';
import '../../../domain/use_cases/delete_review_usecase.dart';
import '../../../domain/use_cases/get_all_review_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllPostsUseCase _getAllPostsUseCase;
  final CreateReviewUseCase _createReviewUseCase;
  final DeletePostUseCase _deletePostUseCase;

  final formKey = GlobalKey<FormState>();

  PostCubit(
    this._getAllPostsUseCase,
    this._createReviewUseCase,
    this._deletePostUseCase,
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

  void createReview({required CreateReviewInput input}) async {
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
}
