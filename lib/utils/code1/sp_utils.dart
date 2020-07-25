import 'dart:convert';

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

  ///保存自定义对象
  static Future saveObject(String key, dynamic value) async {
      _sharedPreferences.setString(key, json.encode(value));
  }
  static dynamic getObject(String key){
    String _data =_sharedPreferences.getString(key) ;
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  static Future<bool> putObjectList(String key, List<Object> list) {
    if (_sharedPreferences == null) return null;
    List<String> _dataList = list?.map((value) {
      return json.encode(value);
    })?.toList();
    return _sharedPreferences.setStringList(key, _dataList);
  }

  ///
  static List<Map> getObjectList(String key) {
    if (_sharedPreferences == null) return null;
    List<String> dataLis = _sharedPreferences.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
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
