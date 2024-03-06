import 'package:yadlo/features/posts/data/model/reviews_models/posts_model_api.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';
import 'package:yadlo/networking/api.dart';

extension ConvertPostsEntityToApiPostsDataEntity on ApiPostDataItem {
  PostsEntity mapPost() {
    return PostsEntity(
        name: name ?? '',
        title: title ?? '',
        description: description ?? '',
        type: type.toString() ?? '',
        commentsCount: commentsCount ?? 0,
        totalVotes: totalVotes ?? 0,
        votesCount: votesCount ?? 0,
        createdAt: createdAt ?? 0,
        user: user?.map(),
        postId: id ?? '',
        attachments: attachments?.map((e) => e.attachmentMap()).toList() ?? []);
  }
}

extension ConvertUserEntityToApiUser on ApiUser {
  UserEntity map() {
    return UserEntity(
      userName: userName.toString() ?? '',
      userID: id ?? '',
    );
  }
}

extension ConvertAttachmentsToAttachment on ApiAttachment {
  Attachments attachmentMap() {
    return Attachments(imageUrl: (ApiConsts.baseUrl + '/'+(link ?? '')));
  }
}

// extension ConvertAttachmentsToAttachment on Attachment {
//   Attachments mob() {
//     return Attachments(
//         link: link ??''
//
//     );
//   }
// }
