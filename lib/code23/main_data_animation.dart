import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2301.dart';
import 'main_data2302.dart';
import 'main_data2303.dart';
import 'main_data2304.dart';
import 'main_data2305.dart';
import 'main_data2306.dart';
import 'main_data2307.dart';
import 'main_data2308.dart';
import 'main_data2309.dart';
import 'main_data2310.dart';
import 'main_data2311.dart';






class AnimationWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<AnimationWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "其他组件"
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
      buildContainerAndClick("透明度动画  AnimatedOpacity",(){NavigatorUtils.pushPage(context, AnimatedOpacityPage());}),

      buildContainerAndClick("透明度动画 FadeTransition",(){NavigatorUtils.pushPage(context, FadeTransitionPage());}),
      buildContainerAndClick("透明度动画 Opacity 与 Slider ",(){NavigatorUtils.pushPage(context, AnimatedOpacityPage2());}),
      buildContainerAndClick("透明度动画 Color ARGB ",(){NavigatorUtils.pushPage(context, AnimatedOpacityFromARGBPage());}),


      buildContainerAndClick("缩放动画 动态修改容器的 内边距 Padding ",(){NavigatorUtils.pushPage(context, AnimatedPaddingPage());}),
      buildContainerAndClick("缩放动画 AnimatedPadding ",(){NavigatorUtils.pushPage(context, AnimatedAnimatedPaddingPage());}),
      buildContainerAndClick("缩放动画 Stack 层叠布局中 AnimatedPositioned 实现的动画效果",(){NavigatorUtils.pushPage(context, AnimatedPositionedPage());}),
      buildContainerAndClick("缩放动画 AnimatedSize 实现的动画效果",(){NavigatorUtils.pushPage(context, AnimatedSizePage());}),
      buildContainerAndClick("缩放动画 ScaleTransition 实现的动画效果",(){NavigatorUtils.pushPage(context, ScaleTransitionPage());}),
      buildContainerAndClick("缩放动画 Transform Scale 实现的动画效果",(){NavigatorUtils.pushPage(context, TransformScalePage());}),


      buildContainerAndClick("WidgetsBindingObserver",(){NavigatorUtils.pushPage(context, FlashAnimationPage());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}