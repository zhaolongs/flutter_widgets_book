import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/common/common_view.dart';

import 'gesture_zoom_box.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1310.dart
//手势识别  双指放大与缩小图片
class DoubleOnScaleImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}


class _TestPageState extends State<DoubleOnScaleImagePage> {
  ///缩放比例
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("双指放大与缩小图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          ///双击
          onDoubleTap: () {
            print("点击了图片");
           setState(() {
             _scale=_scale==1.0?2.0:1.0;
           });
          },
          child: Container(
            width: 160,
            height: 160,
            child: Transform(
              transform: Matrix4.identity()
                ..scale(_scale, _scale),
              child: Image.asset(
                "assets/images/2.0x/banner1.webp",
                fit: BoxFit.fill,
              ),
              alignment: Alignment.center,
            )
          ),
        ),
      ),
    );
  }
}
