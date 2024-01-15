import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/features/auth/data/repository/user_repo_imp.dart';
import 'package:yadlo/features/auth/domain/repository/login_repository.dart';
import 'package:yadlo/features/auth/domain/usecases/login_usecase.dart';
import 'package:yadlo/networking/api.dart';

import '../../features/auth/cubit-auth/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;

class AppDi {
  static Future<void> setupGetIt() async {

    getIt.registerLazySingleton<Link>(() {
      final link = Link.from([
        HttpLink(
          ApiConsts.apiBaseUrl,
          defaultHeaders: {
            "Apollo-Require-Preflight": "true",
          },
        )
      ]);
      final authLink = AuthLink(getToken: () async {
        const token = ApiConsts.token;
        if (token.isNotEmpty) {
          return 'Bearer $token';
        } else {
          return null;
        }
      });

      final concatLink = authLink.concat(link);

      final x = Link.split((request) => request.isSubscription, concatLink);
      return x;
    });

    getIt.registerLazySingleton<GraphQLClient>(
        () => GraphQLClient(link: getIt(), cache: GraphQLCache()));

    getIt.registerLazySingleton<ApiConsts>(() => ApiConsts());

    // getIt.registerLazySingleton<$LoginStateCopyWith>(() => $LoginStateCopyWith());

    getIt.registerLazySingleton<UserLoginRepository>(
        () => UserRepositoryImpl(getIt()));
    getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  }
}
