import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_user.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/24.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

class  UserHelper{
  ///是否同同意隐私与用户协议
  bool _userProtocol = false;

  UserHelper.init();

  static UserHelper getInstance = UserHelper.init();

  UserBean _userBean;

  UserBean get userBean => _userBean;
  bool get userProtocol =>_userProtocol;
  bool get isUserProtocol =>_userProtocol==null?false:_userProtocol;
  set userProtocol(_){
    _userProtocol=_;
    SPUtil.save(spUserProtocolKey,true);
  }

}