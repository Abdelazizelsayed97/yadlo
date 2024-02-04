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
