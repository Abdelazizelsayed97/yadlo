// class ResetPasswordVerify {
//   final DoesUserWithVerificationCodeExist? doesUserWithVerificationCodeExist;
//
//   ResetPasswordVerify({
//     this.doesUserWithVerificationCodeExist,
//   });
//
// }
//
// class DoesUserWithVerificationCodeExist {
//   final bool? data;
//   final String? message;
//   final bool? success;
//   final int? code;
//
//   DoesUserWithVerificationCodeExist({
//     this.data,
//     this.message,
//     this.success,
//     this.code,
//   });
//
// }
class ResetPasswordVerify {
  final DoesUserWithVerificationCodeExist? doesUserWithVerificationCodeExist;

  ResetPasswordVerify({
    this.doesUserWithVerificationCodeExist,
  });

  factory ResetPasswordVerify.fromJson(Map<String, dynamic> json) {
    return ResetPasswordVerify(
      doesUserWithVerificationCodeExist: json['doesUserWithVerificationCodeExist'] != null
          ? DoesUserWithVerificationCodeExist.fromJson(json['doesUserWithVerificationCodeExist'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doesUserWithVerificationCodeExist': doesUserWithVerificationCodeExist?.toJson(),
    };
  }
}

class DoesUserWithVerificationCodeExist {
  final bool? data;
  final String? message;
  final bool? success;
  final int? code;

  DoesUserWithVerificationCodeExist({
    this.data,
    this.message,
    this.success,
    this.code,
  });

  factory DoesUserWithVerificationCodeExist.fromJson(Map<String, dynamic> json) {
    return DoesUserWithVerificationCodeExist(
      data: json['data'],
      message: json['message'],
      success: json['success'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'success': success,
      'code': code,
    };
  }
}