const String registerRequest = r"""
     mutation Register($input: RegisterInput!){
  register(input:$input){
    data{
      isRegisteredViaSocial
    }
    success
    code
    message
  }
} 
    """;
