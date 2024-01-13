import 'package:yadlo/features/auth/data/model/login_model.dart';

const String loginRequest = r"""
mutation EmailAndPasswordLoginInput($input:EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
  data{
    id
    userName
    token
    
  }
    message
    success
    code
}
}
""";

