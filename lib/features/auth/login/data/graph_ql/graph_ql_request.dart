
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

