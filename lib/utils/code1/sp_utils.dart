
/// /lib/utils/code1/sp_utils.dart
//保存用户对应用程序语言环境的偏好设置shared_preferences插件的操作工具类
import 'package:shared_preferences/shared_preferences.dart';
class SPUtil {
  static Future save(String key, String value) async {// 异步保存
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
  static Future<String> get(String key) async {// 异步读取
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }
}
