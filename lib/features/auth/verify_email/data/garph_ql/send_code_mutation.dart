const String SendCodeRequest = r"""
mutation sendEmailVerificationCode{
  sendEmailVerificationCode(input:{
    email:"fghjkl@gmail.com",
    useCase:EMAIL_VERIFICATION
  }){
    data
    code
    success
    message
  }
}
""";