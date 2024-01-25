import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static final GraphQlConfig _instance = GraphQlConfig._();

  GraphQlConfig._();

  factory GraphQlConfig() {
    return _instance;
  }

  late GraphQLClient client;
  late Link _link;
  late final AuthLink _authLink;
  late final HttpLink _httpLink;
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    _authLink = AuthLink(getToken: () async {
      const token = '';
      if (token.isNotEmpty ?? false) {
        return 'Bearer $token';
      } else {
        return null;
      }
    });
    _httpLink = HttpLink(
      'https://yodly.onrender.com/graphql',
      defaultHeaders: {
        "Apollo-Require-Preflight": "true",
      },
    );
    _link = _authLink.concat(_httpLink);
    client = GraphQLClient(
      link: _link,
      cache: GraphQLCache(),
    );
    _isInitialized = true;
  }
}
