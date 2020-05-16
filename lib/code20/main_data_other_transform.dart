import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code/main_login1.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2001.dart';
import 'main_data2002.dart';
import 'main_data2003.dart';
import 'main_data2004.dart';
import 'main_data2005.dart';
import 'main_data2006.dart';





class OtherTransformWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<OtherTransformWidgetMainPage> {

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
   return SingleChildScrollView(child: Row(children: [
     Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
//     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("Transform 旋转",(){NavigatorUtils.pushPage(context, TransformBaseUsePage());}),
      buildContainerAndClick("Transform 缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage());}),
      buildContainerAndClick("Transform 水平或竖直缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage2());}),
      buildContainerAndClick("Transform 函数方式缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage3());}),
      buildContainerAndClick("Transform 函数平移变换",(){NavigatorUtils.pushPage(context, TransformTranslationPage2());}),
      buildContainerAndClick("Transform 矩阵数组平移变换",(){NavigatorUtils.pushPage(context, TransformTranslationPage1());}),




    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}