import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

class LocaleState extends ChangeNotifier {
  Locale _locale; //主题
  LocaleState(this._locale);

  factory LocaleState.zh() => LocaleState(Locale('zh', 'CH'));

  factory LocaleState.en() => LocaleState(Locale('en', 'US'));

  void changeLocaleState(LocaleState state) {
    LogUtil.e("修改语言环境 $state");
    _locale = state.locale;
    notifyListeners();
    SPUtil.save(spUserLocalLanguageKey, state.toString());
  }

  Locale get locale => _locale; //获取语言
}
