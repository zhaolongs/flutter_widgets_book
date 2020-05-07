import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data76.dart';
import 'main_data77.dart';
import 'main_data78.dart';
import 'main_data79.dart';
import 'main_data80.dart';
import 'main_data81.dart';
import 'main_data82.dart';
import 'main_data83.dart';
import 'main_data84.dart';





class TextFieldMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


///6 /lib/code3/main_data75.dart
/// 文本输入框的基本使用
class _FirstPageState extends State<TextFieldMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "文本输入框"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
   return Row(children: [
     Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),),
     Container(child: Column(children: [],),),
   ],);
  }

  bluldLeftWidget(BuildContext context){
    return [
      RaisedButton(child: Text("TextField基本使用"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldUsePage()); },),
      RaisedButton(child: Text("密码输入"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldPassword()); },),
      RaisedButton(child: Text("输入字母大写"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCapitalization()); },),
      RaisedButton(child: Text("键盘回车样式"),onPressed: () { NavigatorUtils.pushPage(context, TextKeyBoardReturn()); },),
      RaisedButton(child: Text("输入焦点控制"),onPressed: () { NavigatorUtils.pushPage(context, TextFouceNote()); },),
      RaisedButton(child: Text("字数限制"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldMaxLengthPage()); },),
      RaisedButton(child: Text("行数限制"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldMaxLinePage()); },),
      RaisedButton(child: Text("限制输入内容"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldContentPage()); },),
      RaisedButton(child: Text("输入边框样式"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldDecPage()); },),



    ];
  }
}