import 'package:dartz/dartz.dart';

import '../model/Postsmodel.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> Cacheposts(List<PostModel>postModel);
}

class LocalDataSourceImpl implements PostLocalDataSource{
  @override
  Future<Unit> Cacheposts(List<PostModel> postModel) {
    // TODO: implement Cacheposts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCacheposts
    throw UnimplementedError();
  }
  
}