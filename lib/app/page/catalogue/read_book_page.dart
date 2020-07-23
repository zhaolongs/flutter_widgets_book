import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class ReadBookPage extends StatefulWidget {
  final List<Widget> list;
  final Function(int index) onChangeCallBack;
  final Function(int index) onClickCallBack;
  final Duration loopDuration;
  final Duration intervalDuration;
  final double height;
  final double width;

  ReadBookPage(
      {@required this.list,
        this.width,
        this.height,
      this.onChangeCallBack,
        this.onClickCallBack,
      this.loopDuration = const Duration(milliseconds: 1000),
      this.intervalDuration = const Duration(milliseconds: 5000)});

  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<ReadBookPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _animation1;

  int index = 0;
  int next = 1;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.loopDuration)
          ..addListener(() {
            setState(() {});
          });
    _animation = Tween(begin: .0, end: pi / 2).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(.0, .5)));
    _animation1 = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(.5, 1.0)));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {



        Future.delayed(widget.intervalDuration,(){
          if(_animationController!=null&&mounted) {
         setState(() {
           index++;
           next = index + 1;
           if (index == widget.list.length - 1) {
             next = 0;
           }
           if (index == widget.list.length) {
             index = 0;
             next = 1;
           }
           if (widget.onChangeCallBack != null) {
             widget.onChangeCallBack(next);
           }
           _animationController.reset();
           _animationController.forward();
         });
          }
        });

      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    super.initState();

    Future.delayed(widget.intervalDuration,(){
      _animationController.forward();
    });
  }

  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      ///填充布局
      body: Container(
        width:widget.width==null?double.infinity:widget.width,
        height: widget.height==null?200:widget.height,
        child: GestureDetector(
          onTapDown: (TapDownDetails details){
            _animationController.stop();
          },
          onTap: (){
            if(widget.onClickCallBack!=null){
              widget.onClickCallBack(index);
            }
            _animationController.forward();
          },
          onTapCancel: (){
            _animationController.forward();
          },
          ///手指移动时的回调 水平方向
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            setState(() {
              ///获取在x轴与y轴上的滑动偏移量
              Offset dOffset = details.delta;
              ///dy为手指移动在y轴方向上的偏移量
              double dx = dOffset.dx;
              _left = _left + dx/100;
              double width = MediaQuery.of(context).size.width;
              double flag = -pi*_left/width;
              _animationController.value=_animationController.value+flag;
              print("水平方向 滑动 $dx flag $flag value ${_animationController.value}");
            });
          },

          ///滑动结束时回调 水平方向
          onHorizontalDragEnd: (DragEndDetails details) {
            //滑动结束时在x、y轴上的速度
            Offset velocityOffset = details.velocity.pixelsPerSecond;
            //滑动结束时在y轴上的速度
            double velocityDX = velocityOffset.dx;
            _left = 0;
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.5,
                      child:buildCurrentWidget(),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation1.value),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5,
                        child: buildNextWidget(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 0.1,
                color: Colors.white,
              ),
              Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerRight,
                      widthFactor: 0.5,
                      child: buildNextWidget(),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation.value),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerRight,
                        widthFactor: 0.5,
                        child: buildCurrentWidget(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCurrentWidget(){
    if(index==-1){
      return Container();
    }else{
      return widget.list[index];
    }
  }
  Widget buildNextWidget(){
    if(next==-1){
      return Container();
    }else{
      return widget.list[next];
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController=null;
    super.dispose();
  }
}
