import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code/main_login1.dart';
import 'package:flutterbookcode/demo/ani/demo_flip_page.dart';
import 'package:flutterbookcode/demo/vn3/main_data3d.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2101.dart';
import 'main_data2102.dart';
import 'main_data2103.dart';
import 'main_data2104.dart';
import 'main_data2105.dart';
import 'main_data2106.dart';
import 'main_data2107.dart';
import 'main_data2108.dart';
import 'main_data2109.dart';
import 'main_data2110.dart';
import 'main_data2111.dart';
import 'main_data2112.dart';
import 'main_data2113.dart';
import 'main_data2114.dart';
import 'main_data2115.dart';
import 'main_data2116.dart';
import 'main_data2117.dart';
import 'main_data2118.dart';
import 'main_data2119.dart';
import 'main_data2120.dart';
import 'main_data2121.dart';







class  CanvasWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<CanvasWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "绘图"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
   return SingleChildScrollView(child: Row(children: [
     Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("x绘图的基本使用",(){NavigatorUtils.pushPage(context, CanvasBaseUsePage());}),



    buildContainerAndClick("绘制点",(){NavigatorUtils.pushPage(context, CanvasdrawPointsPage());}),
      buildContainerAndClick("绘制直线",(){NavigatorUtils.pushPage(context, CanvasdrawLinePage());}),
      buildContainerAndClick("绘制二维坐标系",(){NavigatorUtils.pushPage(context, CanvasXYePage());}),
      buildContainerAndClick("绘制矩形",(){NavigatorUtils.pushPage(context, DrawReactPage());}),




      buildContainerAndClick("绘制弧",(){NavigatorUtils.pushPage(context, DrawArcPage());}),
      buildContainerAndClick("绘制圆角矩形",(){NavigatorUtils.pushPage(context, DrawRReactPage());}),
     buildContainerAndClick("绘制嵌套矩形",(){NavigatorUtils.pushPage(context, DRRectReactPage());}),
      buildContainerAndClick("绘制圆形",(){NavigatorUtils.pushPage(context, DRCirclePage());}),

      buildContainerAndClick("绘制椭圆",(){NavigatorUtils.pushPage(context, OvalPage());}),
      buildContainerAndClick("绘制路径",(){NavigatorUtils.pushPage(context, PathPage());}),

      buildContainerAndClick("QQ粘性组件",(){NavigatorUtils.pushPage(context, PathQQPage());}),

      buildContainerAndClick("drawColor",(){NavigatorUtils.pushPage(context, DrawColorPage());}),


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [
      buildContainerAndClick("canvas save",(){NavigatorUtils.pushPage(context, CanvasSavePage());}),

      buildContainerAndClick("点击波浪效果",(){NavigatorUtils.pushPage(context, WaterWavesPage());}),
      buildContainerAndClick("绘制一个标签",(){NavigatorUtils.pushPage(context, TagsPage());}),

      buildContainerAndClick("绘制文本",(){NavigatorUtils.pushPage(context, CanvasTextPage());}),

      buildContainerAndClick("绘制阴影",(){NavigatorUtils.pushPage(context, DrawShadowPage());}),
      buildContainerAndClick("绘制图片",(){NavigatorUtils.pushPage(context, DrawImagePage());}),
      buildContainerAndClick("放大预览图片",(){NavigatorUtils.pushPage(context, BiggerImageView());}),



    ];
  }

}