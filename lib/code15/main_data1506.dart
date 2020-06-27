import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1506.dart
class NestScrollBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

///lib/code15/main_data1506.dart
class ScrollHomePageState extends State {
  ///SliverAppBar中配置的flexibleSpace展开的高度
  double expandedHeight = 200.0;

  ///NestedScrollView的滚动控制器
  ScrollController scrollController = new ScrollController();

  ///透明组件的透明度比率
  ///0.0 -1.0
  double slidRatio = 0.0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      ///获取滚动距离
      double offset = scrollController.offset;

      ///在这里配置的可折叠的高度为200;
      ///AppBar的高度为[kToolbarHeight] 56.0
      double toobarHeight = kToolbarHeight;

      ///当滑动的距离 offset 大于 [flagHeight]
      ///这个值时，代表折叠的内容区已开始隐藏
      double flagHeight = 200 - toobarHeight * 2;
      if (offset > flagHeight) {
        ///计算透明度
        slidRatio = (offset - flagHeight) / toobarHeight;
        print("滑动的距离 $offset slidRatio $slidRatio");
        if (slidRatio > 1) {
          slidRatio = 1.0;
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///页面主体内容
      body: buildSingleScrollView(),
    );
  }

  ///SingleChildScrollView 的基本使用
  Widget buildSingleScrollView() {
    ///滑动视图
    return NestedScrollView(
      controller: scrollController,

      ///超出显示内容区域的Widget
      body: buidChildWidget(),

      ///配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar2()];
      },
    );
  }

  ///SliverAppBar的基本使用
  buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      snap: false,

      ///当此值为true时 SliverAppBar 会固定在页面顶部
      ///当此值为fase时 SliverAppBar 会随着滑动向上滑动
      pinned: false,

      title: Text("标题"),
    );
  }

  ///lib/code15/main_data1506.dart
  ///SliverAppBar的基本使用
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar2() {
    return SliverAppBar(
      title: buildHeader(),

      ///标题居中
      centerTitle: true,

      ///当此值为true时 SliverAppBar 会固定在页面顶部
      ///当此值为fase时 SliverAppBar 会随着滑动向上滑动
      pinned: true,

      ///SliverAppBar中的AppBar与flexibleSpace
      ///中配制的FlexibleSpaceBar属于浮动关系
      ///结合snap为true来使用
      floating: false,

      ///当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
      ///反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
      snap: false,

      ///展开的高度
      expandedHeight: expandedHeight,

      ///AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        ///背景
        ///配置的是一个widget也就是说在这里可以使用任意的
        ///Widget组合 在这里直接使用的是一个图片
        background: Image.asset(
          "assets/images/2.0x/banner3.webp",
          height: expandedHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  ///页面的主体内容
  Widget buidChildWidget() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("测试数据$index"),
        );
      },
      itemCount: 100,
    );
  }

  ///构建SliverAppBar的标题title
  buildHeader() {
    ///透明组件
    return Opacity(
      ///透明度
      opacity: slidRatio,
      child: Text("这里是标题"),
    );
  }
}
