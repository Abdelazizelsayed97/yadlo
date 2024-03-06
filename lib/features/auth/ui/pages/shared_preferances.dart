import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPreferences;

  static Future sharedInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveToShard(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static String getFromShard({required String key}) {
    return  sharedPreferences.getString(key) ?? '';
  }

  static Object removeFromShard({required String key}) {
    return sharedPreferences.remove(key) ?? '';
  }
}
