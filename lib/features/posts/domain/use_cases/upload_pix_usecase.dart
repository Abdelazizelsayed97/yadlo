import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';
import 'package:yadlo/features/posts/domain/repo/posts_repository.dart';
import 'package:yadlo/networking/api.dart';

class UploadPixUseCase {
  final PostsRepository postsRepository;

  UploadPixUseCase(this.postsRepository);

  Future<Either<ApiError, String>> execute(UploadInput input) async {
return await postsRepository.uploadImageCover(input);
  }
}
