
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///4.1
///AppBar的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

///4.9 /lib/code3/main_data60.dart
///FlexibleSpaceBar使用分析
///SliverAppBar 配置可折叠的布局
///经内内容布局效果
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{



  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }


  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("这是一个标题"),
        leading: Icon(Icons.home),
        centerTitle: true,
        brightness: Brightness.light,
        textTheme: TextTheme(),
        iconTheme: IconThemeData(),
        actionsIconTheme: IconThemeData(),
        primary: true,
        shape:RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.all(Radius.circular(10))) ,
        elevation: 12,

      ),
      body: Center(child: Text("内容主体"),),);
  }

  Widget buildBodyFunction2() {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              actions: [],
            elevation: 12,

              centerTitle: true,
              //固定在顶部
              pinned: true,

              title: Text("这是一个标题"), leading: Icon(Icons.home),)
          ];
        },
        body: Center(child: Text("内容主体"),),),);
  }

}