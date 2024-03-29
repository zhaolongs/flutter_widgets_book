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

///lib/code23/main_data2311.dart
class TransformScalePage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/main_data2311.dart
class _TransformPageState extends State<TransformScalePage>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    ///创建控制器
    _animationController = new AnimationController(
        ///最小值
        lowerBound: 0.0,
        ///最大值
        upperBound: 1.0,
        ///正向执行的时间
        duration: Duration(milliseconds: 1000),
        ///反向执行的时间
        reverseDuration: Duration(milliseconds: 1800),
        ///绑定Ticker
        vsync: this);
    ///添加动画监听
    _animationController.addListener(() {
      ///实时更新
      _scaleValue = _animationController.value;
      setState(() {});
    });
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
        title: Text("缩放动画"),
      ),

      ///线性布局将缩放组件与滑块上下排列
      body: Column(
        ///子组件顶部对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建缩放组件
          buildScalContainer(),

          ///构建滑块
          buildContainer(),

          ///
          buildButton(),
        ],
      ),
    );
  }

  ///lib/code23/main_data2311.dart
  ///构建滑块
  Container buildContainer() {
    return Container(
      ///线性布局将滑块与显示文字左右排列
      child: Row(
        children: [
          ///填充布局 权重适配
          Expanded(
            child: Container(
              ///滑块
              child: Slider(
                ///滑块的最小值
                min: 0.0,

                ///滑块的最大值
                max: 1.0,

                ///当前滑动的值
                value: _scaleValue,

                ///当滑动时的回调
                onChanged: (value) {
                  setState(() {
                    _scaleValue = value;
                  });
                },
              ),
            ),
          ),

          ///显示缩放度的文本
          Padding(

              ///设置一个右边距
              padding: EdgeInsets.only(right: 16),

              ///opacityLevel.toStringAsFixed(2)方法用来保留两位小数
              child: Text("当前的缩放值${_scaleValue.toStringAsFixed(2)}")),
        ],
      ),
    );
  }

  ///lib/code23/main_data2311.dart
  ///当前的缩放比 小于 1.0 为缩小
  ///         大于 1.0 为放大
  double _scaleValue = 0.0;

  ///构建缩放变换
  ///实现的是等比缩放
  Widget buildScalContainer() {
    ///通过静态方法来构建
    return Transform.scale(
      ///设置缩放中心  左上角
      alignment: Alignment.topLeft,
      ///设置缩放的值
      scale: _scaleValue,
      ///执行缩放变换的子Widget
      child: Container(
        height: 300,width: 300,
        color: Colors.blue,
      ),
    );
  }

  buildButton() {
    return RaisedButton(
      child: Text("开启动画"),
      onPressed: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
    );
  }
}
