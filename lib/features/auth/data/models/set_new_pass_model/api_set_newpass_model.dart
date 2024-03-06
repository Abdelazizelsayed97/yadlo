class SetNewPassword {
  final ResetPasswordByEmail? resetPasswordByEmail;

  SetNewPassword({
    this.resetPasswordByEmail,
  });

  factory SetNewPassword.fromJson(Map<String, dynamic> json) {
    return SetNewPassword(
      resetPasswordByEmail: json['resetPasswordByEmail'] != null
          ? ResetPasswordByEmail.fromJson(json['resetPasswordByEmail'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resetPasswordByEmail': resetPasswordByEmail?.toJson(),
    };
  }
}

class ResetPasswordByEmail {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  ResetPasswordByEmail({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ResetPasswordByEmail.fromJson(Map<String, dynamic> json) {
    return ResetPasswordByEmail(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      code: json['code'],
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'code': code,
      'success': success,
      'message': message,
    };
  }
}

class Data {
  final dynamic token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
