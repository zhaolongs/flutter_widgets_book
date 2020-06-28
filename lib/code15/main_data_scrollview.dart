import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1501.dart';
import 'main_data1502.dart';
import 'main_data1503.dart';
import 'main_data1504.dart';
import 'main_data1505.dart';
import 'main_data1506.dart';
import 'main_data1507.dart';
import 'main_data1508.dart';
import 'main_data1509.dart';







class ScrollViewMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ScrollViewMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "ScrollView滑动视图"
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

      buildContainerAndClick("SingleChildScrollView 的基本使用",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage());}),
      buildContainerAndClick("SingleChildScrollView 的属性分析",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage2());}),
      buildContainerAndClick("SingleChildScrollView 的属性 floationg 分析",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage4());}),


      buildContainerAndClick("SingleChildScrollView 的controller",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage3());}),

      buildContainerAndClick("SingleChildScrollView 结合Column使用",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage4());}),
      buildContainerAndClick("SingleChildScrollView 下拉刷新",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage5());}),


      buildContainerAndClick("NestedScrollView 的基本使用",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage());}),

      buildContainerAndClick("NestedScrollView 中searchBar的大小变动",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage2());}),

      buildContainerAndClick("NestedScrollView 商品详情页面",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage3());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}