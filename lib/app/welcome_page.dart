import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/base/pop_base_state.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'base/pop_base_state.dart';
import 'page/home/home_main_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

class WelcomePage extends StatefulWidget {
  WelcomePage();

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends PopBaseState<WelcomePage> {
  Timer _timer;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      progress += 100;
      if (progress % 1000 == 0) {
        if (borderWidth == 1.0) {
          borderWidth = 8.0;
        } else {
          borderWidth = 1.0;
        }
      }
      if (progress >= totalProgress) {
        _timer.cancel();
        goHome();
      }
      LogUtil.e("定时器 $progress");
      setState(() {});
    });
  }

  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    ///取消定时
    _timer.cancel();
    super.dispose();
  }

  double progress = 1000;
  double totalProgress = 6000;
  double borderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              top: 0,
              child: Image.asset("assets/images/3.0x/welcome.png",fit: BoxFit.fill,),
            ),
            Positioned(
              right: 20,
              top: 60,
              child: InkWell(
                onTap: () {
                  goHome();
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: Colors.grey, width: 2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: borderWidth,
                        ),
                      ]),
                  duration: Duration(milliseconds: 1000),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress / totalProgress,
                      ),
                      Text(
                        "${progress ~/ 1000}",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goHome() {
    NavigatorUtils.openPageByFade(context, HomeMainPage(), isReplace: true);
  }
}
