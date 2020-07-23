import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/pop_base_state.dart';
import 'common_dialog.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

showPermissionRequestPage(
    { @required BuildContext context,
    @required Permission permission,
    @required List<String> permissionMessageList,
      bool isColseApp =true,
      Function(dynamic value)  dismissCallback}) {
  ///权限请求
  NavigatorUtils.openPageByFade(
      context,
      PermissionRequestPage(
        permissionMessageList: permissionMessageList,
        permission: permission,
          isColseApp:isColseApp,
      ),
      opaque: false, dismissCallBack: (value) {
    ///权限请求结束获取权限后进行初始化操作
    ///如果未获取权限是对权限进行关闭的
    if(dismissCallback!=null){
      dismissCallback(value);
    }
  });
}

class PermissionRequestPage extends StatefulWidget {

  final Permission permission;
  final List<String> permissionMessageList;
  final bool isColseApp;
  PermissionRequestPage(
      {@required this.permission, @required this.permissionMessageList,this.isColseApp=true});
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends PopBaseState<PermissionRequestPage>
    with WidgetsBindingObserver {
  bool isOpenSetting = false;

  @override
  void initState() {
    super.initState();
    LogUtil.e("权限请求页面");
    WidgetsBinding.instance.addObserver(this); //添加观察者
    ///检查权限
    checkPermissonFunction();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //销毁观察者
  }

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && isOpenSetting) {
      checkPermissonFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      ///填充布局
      body: new Material(
          type: MaterialType.transparency,
          child: WillPopScope(
            onWillPop: () async {
              ///退出APP
              closeApp();
              return Future.value(false);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
            ),
          )),
    );
  }

  void checkPermissonFunction({PermissionStatus status}) async {

    LogUtil.init(isDebug: true);
    if (Platform.isAndroid) {
      ///获取文件存储的权限状态
      if (status == null) {
        status = await Permission.storage.status;
      }
      LogUtil.e("文件存储权限的状态 $status");
      if (status.isUndetermined) {
        ///以前从未请求过
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[0],
            cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
            selectText:StringLanguages.of(context).get(StringKey.buttonConsent),
            selectCallBack: () {
              ///请求权限
              requestStoragePermisson();
            },
            cancleCallBack: () {
              closeApp();
            }, context: context);
      } else if (status.isDenied) {
        ///用户拒绝
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[1],
            cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
            selectText: StringLanguages.of(context).get(StringKey.buttonTautology),
            selectCallBack: () {
              ///请求权限
              requestStoragePermisson();
            },
            cancleCallBack: () {
              closeApp();
            }, context: context);
      } else if (status.isPermanentlyDenied) {
        ///用户拒绝后并选择不再提示
        ///用户拒绝
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[2],
            cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
            selectText: StringLanguages.of(context).get(StringKey.buttonGoSetting),
            selectCallBack: () async {
              ///请求权限
              isOpenSetting = await openAppSettings();
              LogUtil.e("打开设置中心 $isOpenSetting");
              if (!isOpenSetting) {
                ///设置中心打开失败
                openSettingFaile();
              }
            },
            cancleCallBack: () {
              closeApp();
            }, context: context);
      } else if (status.isGranted) {
        ///权限通过
        Navigator.of(context).pop();
      } else if (status.isRestricted) {
        ///用户拒绝 在 iOS 中有效
      }
    }
  }

  void openSettingFaile() {
    showCommonAlertDialog(
        contentMessag: StringLanguages.of(context).get(StringKey.storePermisson4),
        cancleText:  StringLanguages.of(context).get(StringKey.buttonExit),
        cancleCallBack: () {
          closeApp();
        }, context: context);
  }

  void requestStoragePermisson() async {
    PermissionStatus status = await Permission.storage.request();
    ///校验权限
    checkPermissonFunction(status: status);
  }


  ///关闭应用程序
  Future<void> closeApp() async {
    if(widget.isColseApp){
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
}
