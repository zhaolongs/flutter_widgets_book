import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1001.dart';
import 'main_data1002.dart';
import 'main_data1003.dart';
import 'main_data1004.dart';
import 'main_data1005.dart';
import 'main_data1006.dart';






class  UilayoutWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<UilayoutWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "UI布局"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
   return SingleChildScrollView(child: Row(children: [
     Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
//     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("Warp流式布局",(){NavigatorUtils.pushPage(context, WarpMain1Page());}),
      buildContainerAndClick("文字TAG标签",(){NavigatorUtils.pushPage(context, TextWarpMain1Page());}),
      buildContainerAndClick("流式布局Flow",(){NavigatorUtils.pushPage(context, FlowMain1Page());}),
      buildContainerAndClick("流式布局Flow初探",(){NavigatorUtils.pushPage(context, FlowMain1Page1());}),
      buildContainerAndClick("圆形动态弹出菜单",(){NavigatorUtils.pushPage(context, FlowMain1Page2());}),
      


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [



    ];
  }

}