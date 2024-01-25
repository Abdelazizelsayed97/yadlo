

import 'package:dartz/dartz.dart';
import 'package:yadlo/features/posts/data/services/post_remote_data_source.dart';
import '../../../../core/errors/home/Error/Exceptions.dart';
import '../../../../core/errors/home/Error/failure.dart';
import '../../../../core/errors/home/connection/internerconnection.dart';
import '../../domain/entities /posts.dart';
import '../../domain/repo/posts_repository.dart';
import '../services/post_local_data_source.dart';

class PostsRepositoriesImpl implements PostsRepository {
  final InternetConnection internetConnection;
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;


  PostsRepositoriesImpl(
      {required this.internetConnection,required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await internetConnection.isConnected) {
      try {
       final remoteData = await remoteDataSource.getallposts();
       localDataSource.Cacheposts(remoteData);
       return right(remoteData);

      }
      on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
       final localData = await localDataSource.getCachedPosts();
        return right(localData);
      }
      on emptyChacheException {return left(EmptyCacheFailure());}
    }

  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addpost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int Id) {
    // TODO: implement deletepost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatepost
    throw UnimplementedError();
  }
}
