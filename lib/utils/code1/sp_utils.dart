/// /lib/utils/code1/sp_utils.dart
//保存用户对应用程序语言环境的偏好设置shared_preferences插件的操作工具类
import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {
  static SharedPreferences _sharedPreferences;

  ///初始化
  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return Future.value(true);
  }

  // 异步保存
  static Future save(String key, dynamic value) async {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    }
  }

  // 异步读取
  static Future<String> getString(String key) async {
    return _sharedPreferences.getString(key);
  }
  static Future<int> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }
  static Future<bool> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }

}
