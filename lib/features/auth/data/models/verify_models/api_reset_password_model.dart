class ResetPasswordVerify {
  final DoesUserWithVerificationCodeExist? doesUserWithVerificationCodeExist;

  ResetPasswordVerify({
    this.doesUserWithVerificationCodeExist,
  });

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

}
