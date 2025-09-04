import 'package:shared_preferences/shared_preferences.dart';

abstract class AppStorage {
  ///Set String Preferences
  static Future<void> setStringPrefs({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return;
  }

  ///Get String Preferences
  static Future<String> getStringPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  ///Set Int Preferences
  static Future<void> setIntPrefs({
    required String key,
    required int value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
    return;
  }

  ///Get Int Preferences
  static Future<int> getIntPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  ///Set Boolean Preferences
  static Future<void> setBoolPrefs({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    return;
  }

  ///Get Boolean Preferences
  static Future<bool> getBoolPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
