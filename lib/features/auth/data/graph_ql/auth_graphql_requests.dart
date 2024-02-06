const String verifyEmailRequest = r"""
mutation verifyUserByEmail($input: VerifyUserByEmailInput!){
  verifyUserByEmail(input:$input){
    data{
         token
        }
    code
    success
    message
  }
} 
""";

const String resetPasswordVerificationRequest = r"""
query doesUserWithVerificationCodeExist($input:IsUserWithVerificationCodeExistInput!){
  doesUserWithVerificationCodeExist(input:$input){
    data
    message
    success
    code
  
  }
}


""";
const String loginRequest = r"""
mutation  emailAndPasswordLogin($input:  EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
    data{
      token
    }
    code
    success
    message
  }
}
""";

const String registerRequest = r"""
 mutation Register($input: RegisterInput!){
  register(input:$input){
    data{
    unVerifiedEmail
    }
    success
    code
    message
  }
} 
    """;
const String sendCodeRequest = r"""
mutation sendEmailVerificationCode($input: SendEmailVerificationCodeInput!){
  sendEmailVerificationCode(input:$input){
    data
    success
    code
    message
  }
} 
""";const String setNewPasswordRequest = r"""
mutation resetPasswordByEmail($input:ResetPasswordByEmailInput!){
     resetPasswordByEmail(input:$input){
    data{
      token
    }
    code
    success
    message
  }
}
""";