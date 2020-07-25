import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2334.dart
/// Hero动画 自定义转场动画
class HeroPage2 extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

class _FlashAnimationPageState extends State<HeroPage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      backgroundColor: Colors.white,
      body: buildContentWidget(),
    );
  }

  /// lib/code23/main_data2334.dart
  /// 页面一的[Hero]
  buildContentWidget() {
    return GestureDetector(
      child: Hero(
          tag: 'hero',
          child: Container(
            color: Colors.deepPurple,
            width: 50.0,
            height: 50.0,
          )),
      onTap: () {
        ///跳转页面二
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return Item2Page();
        }));
      },
    );
  }
}

/// lib/code23/main_data2334.dart
class Item2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Item2PageState();
  }
}

class _Item2PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面二"),
      ),
      backgroundColor: Colors.white,

      ///页面二中的Hero
      body: Center(
        child: buildHero(),
      ),
    );
  }

  /// lib/code23/main_data2334.dart
  /// 页面二中的Hero
  Hero buildHero() {
    return Hero(
      tag: 'hero',
      child: Icon(Icons.image),

      ///添加占位的图标
      placeholderBuilder: (
        BuildContext context,
        Size heroSize,
        Widget child,
      ) {
        return Icon(Icons.hd, size: 150.0,);
      },
      ///添加过渡中的占位图标
      ///参数 direction 是HeroFlightDirection类型
      ///   [HeroFlightDirection.push] 进入页面二中的回调
      ///   [HeroFlightDirection.pop] 回到页面二中的回调
      flightShuttleBuilder:
          (flightContext, animation, direction, fromContext, toContext) {
        return Icon(
          Icons.rowing,
          size: 150.0,
        );
      },
    );
  }
}
