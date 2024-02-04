const String sendCodeRequest = r"""
mutation sendEmailVerificationCode($input: SendEmailVerificationCodeInput!){
  sendEmailVerificationCode(input:$input){
    data
    success
    code
    message
  }
} 
""";