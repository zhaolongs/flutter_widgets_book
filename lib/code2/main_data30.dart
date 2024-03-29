//3.3  /lib/code2/main_data30.dart

//drawer配制侧拉页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//应用入口 
main() => runApp(themDataFunction());
MaterialApp themDataFunction() {
  return MaterialApp(
    home: FirstPage6(),);
}
class FirstPage6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
class FirstThemState extends State<FirstPage6> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //左侧侧拉页面
      drawer:buildDrawer() ,
      //右侧侧拉页面
      endDrawer: buildDrawer(),
      //页面的头部
      appBar: AppBar(title: Text("标题"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("显示日期"),),
    );
  }
  //封装方法
  Container buildDrawer(){
    //Container可看做是一个容器，用来包裹一些Widget
    return Container(
      //背景颜色
      color: Colors.white,
      width: 200,
      //Column可以让子Widgt在垂直方向线性排列
      child: Column(
        children: <Widget>[
          Container(color: Colors.blue,height: 200,child: Text("这是一个Text"),),
          Container(color: Colors.red,height: 200,child: Text("这是一个Text2"),),
        ],
      ),
    );
  }
}
