import '../../domain/entities /users_entitis/users_entities.dart';
import '../model/users_model/users_model.dart';

extension convertApiUserModelToUserEntity on ApiUserModel{
  UserEntities xxx(){
    return  UserEntities(id: id  ??'' );
  }
}