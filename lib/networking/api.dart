import "package:graphql_flutter/graphql_flutter.dart";

class ApiConsts {
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZTQzOThjZS1jZTNkLTQyZjgtYjc5Ny1lOWU3NDYwY2YwYTkiLCJpYXQiOjE3MDQ5NjY5MTB9.Vzht0Md7Ppq_LwIp7TUGRWZz6iHUrUTQQIONTYi_5L4";
  static const String apiBaseUrl = 'https://yodly.onrender.com/graphql';

  static final ApiConsts object = ApiConsts();

  late final GraphQLClient constsClient;
  final Link httpLink = HttpLink(
    apiBaseUrl,
  );
  final Link _authLink = AuthLink(
    getToken: () => token,
  );
  final GraphQLCache cache = GraphQLCache();

  init() {
    constsClient = GraphQLClient(
      link: _authLink.concat(httpLink),
      cache: cache,
      defaultPolicies: DefaultPolicies(
        query: Policies.safe(FetchPolicy.cacheAndNetwork, ErrorPolicy.all,
            CacheRereadPolicy.ignoreAll),
      ),
    );
  }
}
