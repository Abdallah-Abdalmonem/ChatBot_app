import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setBoolean({
    required String key,
    required bool value,
  }) {
    sharedPreferences?.setBool(key, value);
  }

  static Future<bool?> getBoolean({
    required String key,
  }) async {
    return await sharedPreferences?.getBool(key);
  }
}
