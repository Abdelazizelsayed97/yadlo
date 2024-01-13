import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import 'package:yadlo/features/auth/data/model/login_model.dart';
import 'package:yadlo/features/auth/domain/repository/login_repository.dart';
import 'package:yadlo/features/posts/data/model/Postsmodel.dart';

class UserRepositoryImpl implements UserLoginRepository {



  @override
  Future<Either<LoginFailure, void>> login() async{
    const PostModel response = PostModel(id: 12, title: 'title', body: "body", image: "image");
    throw Exception();
  }
}
