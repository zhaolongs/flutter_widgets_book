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

///lib/code15/main_data1701.dart
///GridView的基本使用
class GridViewBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("GridView基本使用"),
      ),

      ///构建列表数据
//      body: buildGridView1(),
      body: buildGridView2(),
    );
  }


  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过构造函数来创建
  Widget buildGridView1() {
    return GridView(
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 3,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),
      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }

  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过构造函数来创建
  Widget buildGridView2() {
    double width = MediaQuery.of(context).size.width;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(" width $width  devicePixelRatio $devicePixelRatio");
    return GridView(
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        ///子Item的最大宽度
        maxCrossAxisExtent: 100,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }

  List<Widget> buildListViewItemList(){
    List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(buildListViewItemWidget(i));
    }
    return list;
  }
  ///lib/code15/main_data1701.dart
  ///创建ListView使用的子布局
  Widget buildListViewItemWidget(int index) {
    return new Container(
      ///子条目的高度
      height: 84,

      ///内容剧中
      alignment: Alignment.center,

      ///根据角标来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }
}
