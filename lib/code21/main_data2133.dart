import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/utils/canvas_path_utils.dart';

///7 /lib/code21/main_data2133.dart
///   Path动画
class AnimateRectPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
///7 /lib/code21/main_data2133.dart
///动态画线动画方式绘制矩形
class _PageState extends State with TickerProviderStateMixin {
  ///创建动画控制器
  AnimationController animationController ;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    animationController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Path 动画 "),
      ),
      ///画板
      body: CustomPaint(
        size: Size(300, 300),
        ///画布
        painter: PathAnimationPainter(animationController.value),
      ),
      floatingActionButton: buildActionButton(),
    );
  }

  FloatingActionButton buildActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.scanner),
      onPressed: () {
        if (animationController.status == AnimationStatus.completed) {
          ///反向执行动画
          animationController.reverse();
        } else {
          ///正向执行动画
          animationController.forward();
        }
      },
    );
  }
}

///7 /lib/code21/main_data2133.dart
class PathAnimationPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度
  ///当前绘制的进度
  double progress;
  PathAnimationPainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    testRect3(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  ///7 /lib/code21/main_data2133.dart
  void testRect3(Canvas canvas) {
    ///创建一个路径
    Path startPath = new Path();
    startPath.moveTo(205,221);
    ///添加一个圆弧
    startPath.cubicTo(220,109,402,200,253,302);

    startPath.lineTo(253,360);
    ///绘制
    canvas.drawPath(startPath, _paint);
  }

  ///7 /lib/code21/main_data2133.dart
  void testRect(Canvas canvas) {
    ///创建一个路径
    Path startPath = new Path();
    ///添加一个矩形
    startPath.addRect(Rect.fromCenter(center: Offset(100,100),width: 150,height: 100));

    PathMetrics pathMetrics =startPath.computeMetrics();
    ///绘制
    canvas.drawPath(startPath, _paint);
  }

  ///7 /lib/code21/main_data2133.dart
  void testRect2(Canvas canvas) {
    ///创建一个路径
    Path startPath = new Path();

    ///添加一个矩形
    startPath.addRect(Rect.fromCenter(center: Offset(100,100),width: 150,height: 100));
    ///测量路径 获取到这个路径中所有的组合单元
    ///将每个单元信息封装到[PathMetric]中
    PathMetrics pathMetrics =startPath.computeMetrics();
    ///遍历Path中的每个单元信息
    pathMetrics.forEach((PathMetric element) {
      ///路径长度
      double length = element.length;
      ///是否闭合
      bool isColosed = element.isClosed;
      ///角标索引
      int index = element.contourIndex;

      print("测量 当前单元的长度为 $length 闭合 $isColosed 角标索引 $index");
    });

    ///获取第一个单元
    PathMetric pathMetric = startPath.computeMetrics().first;

    ///测量并裁剪路径
    Path extractPath = pathMetric.extractPath(
      ///参数一 开始测量的路径长度位置
      ///参数二 结束测量的路径长度位置
        0.0, pathMetric.length * progress);
    ///绘制测量裁剪后的路径
    canvas.drawPath(extractPath, _paint);
  }


}
