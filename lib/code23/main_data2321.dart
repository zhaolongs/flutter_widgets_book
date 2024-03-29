import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code23/main_data2321.dart
class BoxConstraintsTweenPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}
///lib/code23/main_data2321.dart
///Tween的基本使用
class _TransformPageState extends State<BoxConstraintsTweenPage>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;

  Animation<BoxConstraints> _animation;

  @override
  void initState() {
    super.initState();
    //  创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // 创建一个 Tween，值从 红色变为 蓝色
    _animation = BoxConstraintsTween(
        begin: BoxConstraints(minHeight: 100,maxHeight: 100),
        end: BoxConstraints(minHeight: 50,maxHeight: 50))
        ///绑定控制器
        .animate(_animationController)
          ///添加监听
          ..addListener(() {
            setState(() {
              print('${_animationController.value}-${_animation.value}');
            });
          });
    ///重复执行
    _animationController.repeat();
  }

  @override
  void dispose() {
    ///销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tween"),
        ),
        ///容器约束
        body: ConstrainedBox(
          constraints: _animation.value,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.blue,
            width: 200,
            height: 10,
          ),
        ));
  }
}
