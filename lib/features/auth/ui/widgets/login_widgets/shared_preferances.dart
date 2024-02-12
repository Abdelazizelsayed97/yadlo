import 'package:shared_preferences/shared_preferences.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/features/auth/data/repositories/login_user_repo_imp.dart';

class SharedPrefs {
 static late  SharedPreferences sharedPreferences;
 static Future sharedInitialization() async{
   sharedPreferences = await SharedPreferences.getInstance();

 }
 static Future<bool> saveToShard({required String key, required String value})async{
   return  await sharedPreferences.setString(key, value);

 }
static String getFromShard({required String key}){
  return sharedPreferences.getString(key) ?? '';
 }
 static Object removeFromShard({required String key}){
  return sharedPreferences.remove(key) ?? '';
 }
}
