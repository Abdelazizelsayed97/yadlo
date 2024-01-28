import 'package:graphql_flutter/graphql_flutter.dart';

import '../error_model.dart';

class ApiError implements Exception {
  final int? code;
  final String? message;

  ApiError({
    this.code,
    this.message,
  });
}

class ApiServerError implements Exception {
  ApiServerError();
}

class ApiErrorMessage2 implements Exception {
  final String message;
  final int code;

  ApiErrorMessage2(this.message, this.code);

  @override
  String toString() {
    return 'ApiEmailAndPassword{message: $message, code: $code}';
  }
}

