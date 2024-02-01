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
