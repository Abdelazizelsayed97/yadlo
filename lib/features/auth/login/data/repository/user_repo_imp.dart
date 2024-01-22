import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../../domain/entities/login_input.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repository/login_repository.dart';
import '../graph_ql/graph_ql_request.dart';
import '../model/api_login_input.dart';
import '../model/login_model.dart';

class UserRepositoryImpl implements UserLoginRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig xx = GraphQlConfig();

  UserRepositoryImpl(this._graphQLClient) {
    xx.init();
  }

  @override
  Future<Either<LoginFailure, UserData>> login(LoginInput input) async {
    final requestResponse = await _graphQLClient.mutate(
      MutationOptions(
          document: gql(loginRequest),
          errorPolicy: ErrorPolicy.all,
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {
            "input": ApiLoginInput(
              email: input.email,
              password: input.password,
              device: "DESKTOP",
            ).toJson(),
          }),
    );
    // if(requestResponse!=null){
    //   final request =
    //       ApiLoginResult.fromJson(requestResponseData).emailAndPasswordLogin;
    //   final data = request.data;
    //   return right(data.map);
    // }else{
    //    throw Exception();
    // }

    final requestResponseData = requestResponse.data;

    print(
        '===>>> ${requestResponseData?.isEmpty.toString()} ---- $requestResponseData');
    try {
      if (!requestResponse.hasException && requestResponseData != null) {
        final request =
            ApiLoginResult.fromJson(requestResponseData).emailAndPasswordLogin;
        final data = request?.data;
        return right(data!.map);
      } else {
        print('else=======');
        throw Exception();
        // throw Exception(ApiLoginResult.fromJson(Map<String,dynamic>()).emailAndPasswordLogin.code);
      }
    } catch (e) {
      print('catch=======');
      throw Exception(e.toString());
    }
  }
}

extension UserDataToApiUserData on ApiUserData {
  UserData get map {
    return UserData(
      token: token ?? '',
    );
  }
}
