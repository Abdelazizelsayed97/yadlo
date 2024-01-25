import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/features/auth/login/data/model/login_model.dart';

import '../error_model.dart';

abstract class LoginFailure extends Equatable {}

class NoConnectionFailure extends LoginFailure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NoExistFailure extends LoginFailure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WrongPassword extends LoginFailure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ApiErrorMessage extends FormatException {
  final int code;
  final String message;

  @override
  ApiErrorMessage(
    this.code,
    this.message,
  ) : super(message);

  static Future<ApiErrorMessage> fetchErrorMessage() async {
    int? code = ApiLoginResult.fromJson(<String, dynamic>{})
        .emailAndPasswordLogin
        ?.code;
    String? message = ApiLoginResult.fromJson(<String, dynamic>{})
        .emailAndPasswordLogin
        ?.message;

    await Future.delayed(const Duration(seconds: 2));

    return ApiErrorMessage(code!, message!);
  }
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

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is ServerException) {
      throw ServerException();
    } else {
      // default error
      apiErrorModel.message;
    }
  }
}