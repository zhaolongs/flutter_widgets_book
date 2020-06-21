import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/common/common_view.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class InkWellUsePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1317.dart
//Inkew
class _TestPageState extends State<InkWellUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击事件"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          SizedBox(height: 40,),
          buildCenterText(),
          SizedBox(height: 40,),
          buildInkWellText(),
        ],
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///Text设置点击事件
  Widget buildCenterText() {
    return GestureDetector(
      onTap: () {},
      child: Text("测试文字"),
    );
  }
  ///通过 InkWell Text设置点击事件
  Widget buildInkWellText() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("测试文字"),
      ),
    );
  }
}
