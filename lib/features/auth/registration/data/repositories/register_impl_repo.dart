import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/features/auth/registration/data/graph_ql/graph_request.dart';
import 'package:yadlo/features/auth/registration/data/model/api_registar_input.dart';
import 'package:yadlo/features/auth/registration/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/registration/domain/repositories/registration_repo.dart';

class RegisterRepositoryImpl extends UserRegisterRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig client = GraphQlConfig();

  RegisterRepositoryImpl(this._graphQLClient) {
    client.init();
  }

  @override
  Future<void> register(RegistrationInput input) async {
    final registerRespone = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(registerRequest),
        variables: {
          "input": ApiRegisterInput(
                  userName: input.userName,
                  email: input.email,
                  password: input.password as String,
                  device: 'DESKTOP')
              .toJson(),
        },
      ),
    );
    final registrationResponeData = registerRespone.data;
    final data = registerRespone.data;
    if (registrationResponeData == null || registerRespone.hasException) {
      throw ServerException();
    } else if (registerRespone.data != null &&
        registerRespone.exception == false) {
      print(data);
    }
  }
}
