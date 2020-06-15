import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1301.dart';
import 'main_data1302.dart';
import 'main_data1303.dart';
import 'main_data1304.dart';
import 'main_data1305.dart';
import 'main_data1306.dart';

class GestureDetectorMainPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorMainPage> {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Radio单行框组件"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),
        ));
  }

  buildBodyFunction(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bluldLeftWidget(context),
              ),
              margin: EdgeInsets.only(right: 20),
            ),
          ),
//     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
        ],
      ),
    );
  }

  bluldLeftWidget(BuildContext context) {
    return [
      buildContainerAndClick("GestureDetector与InkWell的基本使用", () {
        NavigatorUtils.pushPage(context, GestureDetectorUsePage());
      }),
      buildContainerAndClick("GestureDetector与使用", () {
        NavigatorUtils.pushPage(context, GesturTapPage());
      }),
      buildContainerAndClick("拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnPanPage());
      }),
      buildContainerAndClick("竖直方向的拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnVerticalPanPage());
      }),
      buildContainerAndClick("水平方向的拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnVerticalPanPage());
      }),

      buildContainerAndClick("图像的移动", () {
        NavigatorUtils.pushPage(context, GesturTapMoveImagePage());
      }),

      buildContainerAndClick("图片的缩放", () {
        NavigatorUtils.pushPage(context, ImageScalePage());
      }),
    ];
  }

  bluldLeftWidget2(BuildContext context) {
    return [];
  }
}
