import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/base/pop_base_state.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import '../../base/pop_base_state.dart';
import 'common_dialog.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

showUserProtocolPage(
    {@required BuildContext context,
    bool isColseApp = true,
    Function(dynamic value) dismissCallback}) {
  ///权限请求
  NavigatorUtils.openPageByFade(
      context,
      UserProtocolRequestPage(
        isColseApp: isColseApp,
      ),
      opaque: false,
      dismissCallBack: dismissCallback);
}

class UserProtocolRequestPage extends StatefulWidget {
  final bool isColseApp;

  UserProtocolRequestPage({this.isColseApp = true});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends PopBaseState<UserProtocolRequestPage> {
  TapGestureRecognizer _registProtocolRecognizer;
  TapGestureRecognizer _privacyProtocolRecognizer;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
  }

  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    super.dispose();

    ///销毁
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      ///填充布局
      body: CommonDialogPage(
        contentWidget: buildRichText(),
        selectText:
            StringLanguages.of(context).get(StringKey.buttonConsentProtocol),
        selectCallBack: (){
          UserHelper.getInstance.userProtocol=true;
          Navigator.of(context).pop();
        },
        cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
        isSelectColose: false,
        cancleCallBack: (){
          closeApp();
        },
      ),
    );
  }
  Future<void> closeApp() async {
    if(widget.isColseApp){
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
  Widget buildRichText() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: RichText(
            textAlign: TextAlign.center,
            ///文字区域
            text: TextSpan(
                text:
                    StringLanguages.of(context).get(StringKey.userReadProtocol),
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                      text: StringLanguages.of(context)
                          .get(StringKey.userProtocol),
                      style: TextStyle(color: Colors.blue),
                      //点击事件
                      recognizer: _registProtocolRecognizer
                        ..onTap = () {
                          print("点击用户协议");
                        }),
                  TextSpan(
                    text: "与",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                      text: StringLanguages.of(context)
                          .get(StringKey.userPrivateProtocol),
                      style: TextStyle(color: Colors.blue),
                      //点击事件
                      recognizer: _privacyProtocolRecognizer
                        ..onTap = () {
                          print("点击隐私协议");
                        }),
                  TextSpan(
                      text: StringLanguages.of(context)
                          .get(StringKey.userConsentProtocol))
                ]),
          ),
        ),
      ),
    );
  }
}
