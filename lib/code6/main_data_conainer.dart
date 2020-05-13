import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code/main_login1.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data100.dart';
import 'main_data101.dart';
import 'main_data102.dart';
import 'main_data103.dart';
import 'main_data104.dart';
import 'main_data105.dart';
import 'main_data97.dart';
import 'main_data98.dart';
import 'main_data99.dart';




class ContainerMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ContainerMainPage> {

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
   Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],);
  }

  bluldLeftWidget(BuildContext context){
    return [
      RaisedButton(child: Text("Container基本使用"),onPressed: () { NavigatorUtils.pushPage(context, ContainerUsePage()); },),


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [
      RaisedButton(child: Text("Container大小限定"),onPressed: () { NavigatorUtils.pushPage(context, ContainerSizePage()); },),
      RaisedButton(child: Text("SizeBox大小限定"),onPressed: () { NavigatorUtils.pushPage(context, ContainerSizeBoxPage()); },),
      RaisedButton(child: Text("Container自身大小"),onPressed: () { NavigatorUtils.pushPage(context, ContainerSizeBoxSelfPage()); },),
      RaisedButton(child: Text("Container自身大小2"),onPressed: () { NavigatorUtils.pushPage(context, ContainerBodySelfPage()); },),
      buildContainerAndClick("Container自身、父布局、子布局都设置大小",(){NavigatorUtils.pushPage(context, ContainerBodySelfChildPage());}),
      buildContainerAndClick("Contrainer自适应包裹子Widget",(){NavigatorUtils.pushPage(context, ContainerWarpPage());}),
      buildContainerAndClick("Container 内外边距配置说明",(){NavigatorUtils.pushPage(context, ContainerWarpPaddingPage());}),
      buildContainerAndClick("Container 边界配置说明",(){NavigatorUtils.pushPage(context, ContainerEdgeInsetsPage());}),


    ];
  }

}