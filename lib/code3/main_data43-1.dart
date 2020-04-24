//4.1.1 /lib/code3/main_data43.dart
//4.1.1线性布局Row在属性title中的使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///4.1
///AppBar的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.1.1 /lib/code3/main_data43-1.dart
//线性布局Row在属性title中的使用
//配置可切换的标签页
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<FirstPage> {

  ///当前显示标签页面的标识 0为推荐标签页面  1为专栏标签页面
  int currentSelectIndex = 0;
  List<Widget> pageList=[];

  @override
  void initState() {
    super.initState();
    ///保存标签页面
    pageList=[
      LeftPage(),
      RightPage(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: buildAppBarTitle(), centerTitle: true,),
      ///页面的主内容区
      ///根据currentSelectIndex动态加载
      body: pageList[currentSelectIndex]);
  }

  ///构建标签栏
  Row buildAppBarTitle() {
    //Row为线性布局，它可以使子Widget在水平方向线性排列
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///InkWell用来配置标签的点击事件
        InkWell(onTap: () {
          setState(() {
            currentSelectIndex = 0;
          });
        }, child:
        Container(
          ///设置内边距
          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6, right: 10),
          ///设置文字显示
          child: Text("推荐", style: TextStyle(
              ///动态加载文字颜色
              color: currentSelectIndex == 0 ? Colors.red : Colors.grey),),
          ///设置圆角边框
          decoration: BoxDecoration(
            ///动态加载标签背景颜色
              color: currentSelectIndex == 0 ? Colors.white : Color(0xFFEEEEEE),
              ///分别设置边框的上下左右四个角的圆角
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4))),),),
        InkWell(onTap: () {
          setState(() {
            currentSelectIndex = 1;
          });
        }, child:
        Container(
          padding: EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 20),
          child: Text("专栏", style: TextStyle(
              color: currentSelectIndex == 1 ? Colors.red : Colors.grey),),
          decoration: BoxDecoration(
              color: currentSelectIndex == 1 ? Colors.white : Color(0xFFEEEEEE),
              borderRadius: BorderRadius.only(topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),),
        )
      ],
    );
  }
}


class LeftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("推荐页面"),),);
  }
}

class RightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("专栏页面"),),);
  }
}