import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<dynamic> getData({
    required String key,
    required dynamic value,
    required String type,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case "String":
        return prefs.getString(key) ?? value;
      case "int":
        return prefs.getInt(key) ?? value;
      case "bool":
        return prefs.getBool(key) ?? value;
      default:
        return value;
    }
  }

  static Future<void> setData({
    required String key,
    required dynamic value,
    required String type,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case "String":
        await prefs.setString(key, value);
        break;
      case "int":
        await prefs.setInt(key, value);
        break;
      case "bool":
        await prefs.setBool(key, value);
        break;
    }
  }

  static Future<void> removeData({
    required String key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> removeAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
