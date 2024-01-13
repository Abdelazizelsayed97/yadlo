import 'package:dartz/dartz.dart';

import '../model/Postsmodel.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getallposts();

  Future<Unit> deletepost(int id);

  Future<Unit> addpost(PostModel postModel);

  Future<Unit> updatepost(PostModel postModel);
}

class PostRemoteImplWithHttp implements PostRemoteDataSource {
  @override
  Future<Unit> addpost(PostModel postModel) {
    // TODO: implement addpost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletepost(int id) {
    // TODO: implement deletepost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getallposts() {
    // TODO: implement getallposts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatepost(PostModel postModel) {
    // TODO: implement updatepost
    throw UnimplementedError();
  }
}
