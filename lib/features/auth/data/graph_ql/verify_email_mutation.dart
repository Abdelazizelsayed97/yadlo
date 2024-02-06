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
