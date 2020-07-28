import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/base/base_life_state.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/29.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/app/page/test/test.dart
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends BaseLifeState<TestPage> {

  @override
  void onResumed() {
    // TODO: implement onResumed
    super.onResumed();
  }

  @override
  void onPause() {
    // TODO: implement onPause
    super.onPause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
            ],
          )),
    );
  }

}