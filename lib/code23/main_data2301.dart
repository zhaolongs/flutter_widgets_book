import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/flash/child/list_placeholder.dart';
import 'package:flutterbookcode/demo/flash/flash_animation_widget.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class FlashAnimationPage extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

//lib/code/main_data.dart
class _FlashAnimationPageState extends State<FlashAnimationPage> {
  ///闪光动画控制器
  FlashAnimationController flashAnimationController =
      new FlashAnimationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("闪光动画"),
      ),
      backgroundColor: Colors.white,
      body: buildContentWidget(),
      floatingActionButton: buildActionButton(),
    );
  }

  buildContentWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: FlashAnimation.fromColors(
        flashAnimationController: flashAnimationController,
        animationLoopCount: 0,
        normalColor: Colors.grey[600],
        highlightColor: Colors.blue,
        animationStart: true,
        child: ListPlacholderWidget(),
      ),
    );
  }

  bool isOpen = true;

  buildActionButton() {
    return FloatingActionButton(
      child: Icon(isOpen?Icons.close:Icons.open_in_browser),
      onPressed: () {
        isOpen = !isOpen;
        if(isOpen){
          flashAnimationController.start();
        }else{
          flashAnimationController.stop();
        }
        setState(() {

        });
      },
    );
  }
}
