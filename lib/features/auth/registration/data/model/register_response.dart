import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterMutation {
  final String registerMutation = '''
    mutation Register(\$input: RegisterInput!){
      register(input:\$input){
        data{
          id
          userName
          slug
          gender
          country
          isBlocked
          isFeatured
          followCount{
            followers
            followings
          }
          totalAwards
          favLang
          notificationManager{
            VIA_PUSH
            NEW_VOTE_ON_REVIEW
            NEW_AWARD
            NEW_REPLY_ON_COMMENT
            NEW_FOLLOWER
            NEW_REPLY_ON_COMMENT
          }
          readableCreatedAt
          createdAt
          updatedAt
          readableUpdatedAt
          isRegisteredViaSocial
          reviewsCount
          unseenNotificationsCount
        }
        success
        code
        message
      }
    }
  ''';

  final GraphQLClient client;

  RegisterMutation(this.client);

  Future<QueryResult> register(RegisterInput input) async {
    final MutationOptions options = MutationOptions(
      document: gql(registerMutation),
      variables: {'input': input.toJson()},
    );

    return await client.mutate(options);
  }
}

class RegisterInput {
  final String username;
  final String email;
  final String password;
  final String device;
  final String code;

  RegisterInput({
    required this.username,
    required this.email,
    required this.password,
    required this.device,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'device': device,
      'code': code,
    };
  }
}
