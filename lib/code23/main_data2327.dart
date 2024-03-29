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

///lib/code23/main_data2327.dart
class CurvedAnimationAndTween extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/main_data2327.dart
///CurvedAnimation结合Tween的基本使用
class _TransformPageState extends State<CurvedAnimationAndTween>
    with SingleTickerProviderStateMixin {

  ///动画控制器
  AnimationController _animationController;
  ///文本样式动画
  Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    ///1、创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    ///2、创建曲线动画
    Animation _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    ///3、创建一个 Tween，
    _animation = TextStyleTween(
      begin: TextStyle(
          color: Colors.blue, fontSize: 14, fontWeight: FontWeight.normal),
      end: TextStyle(
          color: Colors.deepPurple, fontSize: 24, fontWeight: FontWeight.bold),
    ).animate(_curvedAnimation);

    ///----------------------------------------------------------------
    ///添加动画状态监听
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ///正向执行完毕后立刻反向执行（倒回去）
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ///反向执行完毕后立刻正向执行
        _animationController.forward();
      }
    });

    ///添加监听
    _animation.addListener(() {
      setState(() {
        print('${_animationController.value}-${_animation.value}');
      });
    });

    ///正向执行
    _animationController.forward();
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
      body: Container(
       child: Text("这是一行Flutter代码",style: _animation.value,),
      ),
    );
  }
}
