//4.1 /lib/code3/main_data41.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///4.1
///AppBar的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code20/main_data2001.dart';
import 'package:flutterbookcode/code6/main_data97.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data65-1.dart';


class MainAppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}
class FirstPagetate extends State<MainAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "container"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
    return Row(children: [
      Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),
      Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),
    ],);
  }

  bluldLeftWidget(BuildContext context){
    return [
      RaisedButton(child: Text("MediaQuery分析"),onPressed: () { NavigatorUtils.pushPage(context, MediaQueryFirstPage()); },),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [

      RaisedButton(child: Text("MediaQuery分析"),onPressed: () { NavigatorUtils.pushPage(context, MediaQueryFirstPage()); },),

    ];
  }
}
