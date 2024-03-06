import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/users_entitis/users_entities.dart';
import 'package:yadlo/features/posts/domain/repo/user_repository.dart';

class UserUseCAse{
  final UserRepository userRepository;

  UserUseCAse({required this.userRepository});
  Future<Either<ApiError,UserEntities>> execute(){
    return userRepository.execute();
  }
}