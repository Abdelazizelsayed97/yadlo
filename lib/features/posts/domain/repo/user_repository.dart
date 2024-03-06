import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/users_entitis/users_entities.dart';

abstract class UserRepository{
  Future<Either<ApiError,UserEntities>> execute();
}